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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
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
        
        // MARK: - appending JSON parsed value to cell
        //        let basicInfoLabelValue = basicsStorage?.basics.profiles[indexPath.row]
        //        cell.basicsInfoLabel.text = basicInfoLabelValue?.network
        
        return cell
    }
}
