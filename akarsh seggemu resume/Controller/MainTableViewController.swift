//
//  MainTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 28.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    //    var basicsStorage: Resume?
    
    let resumeNameArrays = ["English resume", "Deutsch Lebenslauf"]
    let emojiOfLanaguageArrays = ["🇬🇧", "🇩🇪"]
    let languageCode = ["en", "de"]
    
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
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 40, bottom: 0, right: 0)
        
        //        self.fetchData { basicsStorage in
        //            self.basicsStorage = basicsStorage
        //            DispatchQueue.main.async {
        //                self.tableView.reloadData()
        //            }
        //        }
    }
    
    //    func fetchData(completionHandler: @escaping (Resume) -> ()) {
    //        let url = "https://raw.githubusercontent.com/akarsh/jsonresume-theme-onepage-simplified/master/resume.json"
    //        if let urlString = URL(string: url) {
    //            let session = URLSession(configuration: .ephemeral)
    //            let dataTask = session.dataTask(with: urlString) { data, _, _ in
    //                if let jsonData = data {
    //                    // do try catch block
    //                    let jsonDecoder = JSONDecoder()
    //                    do {
    //                        let basicsStorage = try jsonDecoder.decode(Resume.self, from: jsonData)
    //                        completionHandler(basicsStorage)
    //                    } catch {
    //                    }
    //                }
    //            }
    //            dataTask.resume()
    //        }
    //    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainCell = sender as? MainTableViewCell,
            let target = segue.destination as? ResumeSchemaTableViewController else {
                return
        }
        
        target.choosenLanguage = mainCell.languageCode
    }
}

// MARK: - Table view data source
extension MainTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resumeNameArrays.count
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
