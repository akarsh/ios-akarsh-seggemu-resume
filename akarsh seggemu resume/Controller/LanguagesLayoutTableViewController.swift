//
//  LanguagesLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 09.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class LanguagesLayoutTableViewController: UITableViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    
    @IBOutlet weak var tableViewHeader: LanguagesLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setlanguagesLayoutTableViewHeader()
        
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    // set the table view header
    func setlanguagesLayoutTableViewHeader() {
        if labelContentHeader != nil {
            tableViewHeader.labelContentLanguagesLayoutTableViewHeader.text = labelContentHeader!
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.languages.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languagesLayoutTableViewCell", for: indexPath) as! LanguagesLayoutTableViewCell
        
        cell.textLabel?.text = basicsContent?.languages[indexPath.row].language
        cell.detailTextLabel?.text = basicsContent?.languages[indexPath.row].fluency
        
        return cell
    }
}
