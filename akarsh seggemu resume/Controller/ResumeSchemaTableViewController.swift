//
//  ResumeSchemaTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 26.11.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class ResumeSchemaTableViewController: UITableViewController {
    var basicsStorage: Resume?
    
    var chosenLanguage: String?
    var labelContentResumeSchemaTableViewHeader: String?
    // Data array contains the key values which are translated according to chosen language
    // Translated values are displayed as label in the cell
    lazy var data: [String] = {
        [
            TranslationHelper.locForKey(chosenLanguage, "contact")!,
            TranslationHelper.locForKey(chosenLanguage, "info")!,
            TranslationHelper.locForKey(chosenLanguage, "summary")!,
            TranslationHelper.locForKey(chosenLanguage, "profiles")!,
            TranslationHelper.locForKey(chosenLanguage, "skills")!,
            TranslationHelper.locForKey(chosenLanguage, "languages")!,
            TranslationHelper.locForKey(chosenLanguage, "education")!,
            TranslationHelper.locForKey(chosenLanguage, "experience")!,
            TranslationHelper.locForKey(chosenLanguage, "volunteer")!,
            TranslationHelper.locForKey(chosenLanguage, "awards")!,
            TranslationHelper.locForKey(chosenLanguage, "publications")!,
            TranslationHelper.locForKey(chosenLanguage, "interests")!,
            TranslationHelper.locForKey(chosenLanguage, "references")!
        ]
    }()
    // Emoji images filenames in the array imageOfSchemaKeys
    let imageOfSchemaKeys = [
        "cardIndex.png",
        "informationSource.png",
        "speechBalloon.png",
        "bustInSilhouette.png",
        "hammerAndWrench.png",
        "globeWithMeridians.png",
        "graduationCap.png",
        "hourglassWithFlowingSand.png",
        "rosette.png",
        "trophy.png",
        "books.png",
        "heavyBlackHeart.png",
        "memo.png"
    ]
    // identitiesOfStoryboards array contains names of the storyboards
    let identitiesOfStoryboards = [
        "ContactLayout",
        "InfoLayout",
        "SummaryLayout",
        "ProfilesLayout",
        "SkillsLayout",
        "LanguagesLayout",
        "EducationLayout",
        "ExperienceLayout",
        "VolunteerLayout",
        "AwardsLayout",
        "PublicationsLayout",
        "InterestsLayout",
        "ReferencesLayout"
    ]
    // file path
    var filePath = ""
    var resumeFileName = ""
    // filename of the profile image
    let imageFileName = "standard_profile.jpg"
    
    @IBOutlet weak var tableViewHeader: ResumeSchemaTableViewHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        
        // Adding separator Inset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        
        //set the table veiw header
        setTableViewHeader()
        
        // set the resume file to chosen language
        self.setResumeFileToChosenLanguage()
        
    }
    
    func setTableViewHeader() {
        // set the table view header
        if labelContentResumeSchemaTableViewHeader != nil {
            tableViewHeader?.labelResumeSchemaTableViewHeader?.text = labelContentResumeSchemaTableViewHeader!
        }
    }
    
    // set the resume file name according to the chosen language
    func setResumeFileToChosenLanguage() {
        chosenLanguage! == "en" ? (self.resumeFileName = "englishResume.json") : (self.resumeFileName = "deutschResume.json")
        self.readData { basicsStorage in
            self.basicsStorage = basicsStorage
            self.downloadImageFromURL()
        }
    }
    
    // read the JSON data file
    func readData(completionHandler: @escaping (Resume) -> Void) {
        // Find documents directory on device
        let dirs: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        do {
            if dirs.count > 0 {
                // documents directory
                let dir = dirs[0]
                // adding the filename to the documents directory as file path
                self.filePath = dir.appendingFormat("/" + self.resumeFileName)
                // Read file content
                let contentFromFile = try String(contentsOfFile: self.filePath, encoding: String.Encoding.utf8)
                let jsonDataParsed = contentFromFile.data(using: .utf8)!
                let jsonDecoder = JSONDecoder()
                do {
                    let basicsStorage = try jsonDecoder.decode(Resume.self, from: jsonDataParsed)
                    completionHandler(basicsStorage)
                } catch {}
            } else {
                print("Could not find local directory to store file")
                return
            }
        } catch (let error as NSError) {
            print("An error took place: \(error)")
        }
    }
    
    func downloadImageFromURL() {
        if basicsStorage?.basics.picture != nil {
            // Create destination URL
            let documentsUrl: URL = DocumentHelper.getDocumentsDirectory()
            // Get the file path in documents directory
            let destinationFileUrl = documentsUrl.appendingPathComponent(self.imageFileName)
            // get the documents directory url
            let dirs: [String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
            if dirs.count > 0 {
                // documents directory
                let dir = dirs[0]
                // adding the filename to the documents directory as file path
                self.filePath = dir.appendingFormat("/" + self.imageFileName)
                // check if the file does not exists
                if !FileManager.default.fileExists(atPath: filePath) {
                    // url to the resume JSON file
                    guard let url = basicsStorage?.basics.picture else { return }
                    DownloadHelper.downloadFromURL(url, destinationFileUrl)
                }
            } else {
                print("Could not find local directory to store file")
                return
            }
        }
    }
}

extension ResumeSchemaTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.imageOfSchemaKeys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "resumeSchemaTableCell", for: indexPath) as? ResumeSchemaTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
        cell.imageOfSchemaKeys.image = UIImage(named: imageOfSchemaKeys[indexPath.row])
        cell.contentLabelOfSchemaKeys.text = data[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName = identitiesOfStoryboards[indexPath.row]
        
        if vcName == "InfoLayout" {
            guard let viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as? InfoLayoutViewController else {
                fatalError("DequeueReusableCell failed while casting")
            }
            viewController.labelContentHeader = data[indexPath.row]
            viewController.basicsContent = basicsStorage
            viewController.chosenLanguage = chosenLanguage
            self.navigationController?.pushViewController(viewController, animated: true)
        } else {
            var viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! LabelHeader
            viewController.labelContentHeader = data[indexPath.row]
            viewController.basicsContent = basicsStorage
            self.navigationController?.pushViewController(viewController as! UIViewController, animated: true)
        }
    }
}
