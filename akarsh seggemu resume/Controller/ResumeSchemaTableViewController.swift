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
    
    lazy var data: [String] = {
        [
            locForKey("contact")!,
            locForKey("info")!,
            locForKey("summary")!,
            locForKey("profiles")!,
            locForKey("skills")!,
            locForKey("languages")!,
            locForKey("education")!,
            locForKey("experience")!,
            locForKey("volunteer")!,
            locForKey("awards")!,
            locForKey("publications")!,
            locForKey("interests")!,
            locForKey("references")!
        ]
    }()
    
    let emojiOfSchemaKeys = ["📇", "ℹ️", "💬", "👤", "🛠", "🌐", "🎓", "⏳", "🏵", "🏆", "📚", "❤️", "📝"]
    
    let identitiesOfStoryboards = [
        "contactLayout",
        "infoLayout",
        "summaryLayout",
        "profilesLayout",
        "skillsLayout",
        "languagesLayout",
        "educationLayout",
        "experienceLayout",
        "volunteerLayout",
        "awardsLayout",
        "publicationsLayout",
        "interestsLayout",
        "referencesLayout"
    ]
    
    // file path
    var filePath = ""
    var resumeFileName = ""
    
    @IBOutlet weak var tableViewHeader: ResumeSchemaTableViewHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        
        // Adding separator Inset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        
        // set the resume file to chosen language
        self.setResumeFileToChosenLanguage()
        
    }
    
    // returns the translated string based on the chosen language
    func locForKey(_ key: String) -> String? {
        guard let path = Bundle.main.url(forResource: "Localizable", withExtension: "strings", subdirectory: nil, localization: chosenLanguage!) else {
            return nil
        }
        guard let dict = NSDictionary(contentsOf: path) else {
            return nil
        }
        return dict.value(forKey: key) as? String
    }
    
    // set the resume file name according to the chosen language
    func setResumeFileToChosenLanguage() {
        if chosenLanguage! == "en" {
            self.resumeFileName = "englishResume.json"
            self.readData{ basicsStorage in
                self.basicsStorage = basicsStorage }
        } else if chosenLanguage! == "de" {
            self.resumeFileName = "deutschResume.json"
        } else {
            return
        }
        // set the table view header
        if labelContentResumeSchemaTableViewHeader != nil {
            tableViewHeader?.labelResumeSchemaTableViewHeader?.text = labelContentResumeSchemaTableViewHeader!
        }
    }
    
    // read the JSON data file
    func readData(completionHandler: @escaping (Resume) -> ()) {
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
//                print(contentFromFile)
                let jsonDecoder = JSONDecoder()
                do {
                    let basicsStorage = try jsonDecoder.decode(Resume.self, from: jsonDataParsed)
                    completionHandler(basicsStorage)
                } catch {}
            } else {
                print("Could not find local directory to store file")
                return
            }
        }
        catch let error as NSError {
            print("An error took place: \(error)")
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
        return self.emojiOfSchemaKeys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resumeSchemaTableCell", for: indexPath) as! ResumeSchemaTableViewCell
        
        cell.contentLabelOfSchemaKeys.text = data[indexPath.row]
        cell.emojiSymbolLabelOfSchemaKeys.text = emojiOfSchemaKeys[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName = identitiesOfStoryboards[indexPath.row]
        
        var viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! LabelHeader
        viewController.labelContentHeader = data[indexPath.row]
        viewController.basicsContent = basicsStorage

//        if vcName == "contactLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! contactLayoutViewController
//        } else if vcName == "infoLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! infoLayoutViewController
//        } else if vcName == "summaryLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! summaryLayoutViewController
//        } else if vcName == "profilesLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! profilesLayoutViewController
//        } else if vcName == "skillsLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! skillsLayoutTableViewController
//        } else if vcName == "languagesLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! languagesLayoutTableViewController
//        } else if vcName == "educationLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! educationLayoutTableViewController
//        } else if vcName == "experienceLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! experienceLayoutTableViewController
//        } else if vcName == "volunteerLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! volunteerLayoutTableViewController
//        } else if vcName == "awardsLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! awardsLayoutTableViewController
//        } else if vcName == "publicationsLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! publicationsLayoutTableViewController
//        } else if vcName == "interestsLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! interestsLayoutTableViewController
//        } else if vcName == "referencesLayout" {
////            viewController = storyboard?.instantiateViewController(withIdentifier: vcName) as! referencesLayoutTableViewController
//        }


        self.navigationController?.pushViewController(viewController as! UIViewController, animated: true)
    }
}


