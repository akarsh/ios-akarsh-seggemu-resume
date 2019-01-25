//
//  MainTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 28.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    // Array of resume language names
    let resumeNameArrays = ["English resume", "Deutsch Lebenslauf"]
    // Array of language image flags
    let imageOfLanaguageArrays = ["flagUnitedKingdom.png", "flagGermany.png"]
    // Array of language codes
    let languageCode = ["en", "de"]
    
    // Filenames for the resume JSON files
    let englishResumeFile = "englishResume.json"
    let germanResumeFile = "deutschResume.json"
    // empty file path declaration
    var filePath = ""
    
    // URLs for the resume JSON files located in GitHub
    let englishResumeURL = "https://raw.githubusercontent.com/akarsh/akarsh.github.io/master/json/en/resume.json"
    let germanResumeURL = "https://raw.githubusercontent.com/akarsh/akarsh.github.io/master/json/de/resume.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        
        // Adding separator Inset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        
        // calling fetchData to download the englishResume.json
        self.fetchData(self.englishResumeFile, self.englishResumeURL)
        self.fetchData(self.germanResumeFile, self.germanResumeURL)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainCell = sender as? MainTableViewCell,
            let target = segue.destination as? ResumeSchemaTableViewController else {
                return
        }
        
        target.chosenLanguage = mainCell.languageCode
        target.labelContentResumeSchemaTableViewHeader = mainCell.nameLabelOfLanguage.text
    }
    
    // MARK: - Fetch Data to create the JSON file in the documents directory
    
    func fetchData(_ resumeFileName: String, _ resumeURL: String) {
        // Create destination URL
        let documentsUrl: URL = DocumentHelper.getDocumentsDirectory()
        // Get the file path in documents directory
        let destinationFileUrl = documentsUrl.appendingPathComponent(resumeFileName)
        
        // Find documents directory on device
        let dirs: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        do {
            if dirs.count > 0 {
                // documents directory
                let dir = dirs[0]
                // adding the filename to the documents directory as file path
                self.filePath = dir.appendingFormat("/" + resumeFileName)
                // delete the file if it exists
                if FileManager.default.fileExists(atPath: self.filePath) {
                    try FileManager.default.removeItem(atPath: self.filePath)
                }
            } else {
                print("Could not find local directory to store file")
                return
            }
        } catch let error as NSError {
            print("An error took place: \(error.localizedDescription)")
        }
        
        // url to the resume JSON file
        DownloadHelper.extractedFunc(resumeURL, destinationFileUrl)
    }
}

// MARK: - Table view data source

extension MainTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resumeNameArrays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableCell", for: indexPath) as? MainTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
        cell.imageOfLanguage.image = UIImage(named: imageOfLanaguageArrays[indexPath.row])
        cell.nameLabelOfLanguage.text = resumeNameArrays[indexPath.row]
        cell.languageCode = languageCode[indexPath.row]
        return cell
    }
}
