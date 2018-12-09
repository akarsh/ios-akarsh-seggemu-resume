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
    var filePath = ""
    
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
        
        //        self.fetchData { basicsStorage in
        //            self.basicsStorage = basicsStorage
        //            DispatchQueue.main.async {
        //                self.tableView.reloadData()
        //            }
        //        }
        
        // calling fetchData to download the englishResume.json
        self.fetchData()
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
    
    // MARK: - Fetch Data from JSON file using dataTask
//    func fetchData(completionHandler: @escaping (Resume) -> ()) {
//        let url = "https://raw.githubusercontent.com/akarsh/jsonresume-theme-onepage-simplified/master/resume.json"
//        if let urlString = URL(string: url) {
//            let session = URLSession(configuration: .ephemeral)
//            let dataTask = session.dataTask(with: urlString) { data, _, _ in
//                if let jsonData = data {
    // do try catch block
//                    let jsonDecoder = JSONDecoder()
//                    do {
//                        let basicsStorage = try jsonDecoder.decode(Resume.self, from: jsonData)
//                        completionHandler(basicsStorage)
//                    } catch {}
//                }
//            }
//            dataTask.resume()
//        }
//    }
    
    // return documents directory as output
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    // MARK: - Fetch Data to create the JSON file in the documents directory
    
    func fetchData() {
        // Create destination URL
        let documentsUrl: URL = getDocumentsDirectory()
        // Get the file path in documents directory
        let destinationFileUrl = documentsUrl.appendingPathComponent(self.englishResumeFile)
        
        // Find documents directory on device
        let dirs: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        do {
            if dirs.count > 0 {
                // documents directory
                let dir = dirs[0]
                // adding the filename to the documents directory as file path
                self.filePath = dir.appendingFormat("/" + self.englishResumeFile)
                // delete the file if it exists
                try FileManager.default.removeItem(atPath: self.filePath)
            } else {
                print("Could not find local directory to store file")
                return
            }
        } catch let error as NSError {
            print("An error took place: \(error.localizedDescription)")
        }
        
        // url to the resume JSON file
        let url = "https://raw.githubusercontent.com/akarsh/jsonresume-theme-onepage-simplified/master/resume.json"
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
        
        // MARK: - appending JSON parsed value to cell
        
        //        let basicInfoLabelValue = basicsStorage?.basics.profiles[indexPath.row]
        //        cell.basicsInfoLabel.text = basicInfoLabelValue?.network
        
        return cell
    }
}
