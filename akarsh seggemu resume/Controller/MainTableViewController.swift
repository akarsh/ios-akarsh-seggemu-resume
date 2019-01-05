//
//  MainTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 28.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    let resumeNameArrays = ["English resume", "Deutsch Lebenslauf"]
    let emojiOfLanaguageArrays = ["🇬🇧", "🇩🇪"]
    let languageCode = ["en", "de"]
    
    let englishResumeFile = "englishResume.json"
    let germanResumeFile = "deutschResume.json"
    var filePath = ""
    
    let englishResumeURL = "https://raw.githubusercontent.com/akarsh/akarsh.github.io/master/json/en/resume.json"
    let germanResumeURL = "https://raw.githubusercontent.com/akarsh/akarsh.github.io/master/json/de/resume.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
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
    
    // return documents directory as output
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    // MARK: - Fetch Data to create the JSON file in the documents directory
    
    func fetchData(_ resumeFileName: String, _ resumeURL: String) {
        // Create destination URL
        let documentsUrl: URL = getDocumentsDirectory()
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
        downloadFileFromUrl(englishResumeURL, destinationFileUrl)
    }
    
    // Download file from the URL and store it in the destination File URL
    fileprivate func downloadFileFromUrl(_ url: String, _ destinationFileUrl: URL) {
        if let urlString = URL(string: url) {
            let sessionConfig = URLSession(configuration: .default)
            let request = URLRequest(url: urlString)
            // download task to download the resume JSON file
            let dataTask = sessionConfig.downloadTask(with: request) { data, response, error in
                if let tempLocalUrl = data, error == nil {
                    // if success print the status code of 200
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                        print("Successfully downloaded. Status code: \(statusCode)")
                    }
                    
                    do {
                        // copying the file to the destination file path
                        try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                        print("File created at \(destinationFileUrl)")
                    } catch let writeError {
                        print("Error creating a file \(destinationFileUrl) : \(writeError)")
                    }
                    
                } else {
                    print("Error took place while downloading a file. Error description: %@ \(String(describing: error?.localizedDescription))")
                }
            }
            dataTask.resume()
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableCell", for: indexPath) as! MainTableViewCell
        
        cell.emojiLabelOfLanguage.text = emojiOfLanaguageArrays[indexPath.row]
        cell.nameLabelOfLanguage.text = resumeNameArrays[indexPath.row]
        cell.languageCode = languageCode[indexPath.row]
        return cell
    }
}
