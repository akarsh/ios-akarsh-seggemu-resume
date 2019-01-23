//
//  AwardsLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class AwardsLayoutTableViewController: UITableViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    
    @IBOutlet weak var tableViewHeader: AwardsLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        
        self.setAwardsLayoutTableViewHeader()
    }
    
    // set the table view header
    func setAwardsLayoutTableViewHeader() {
        if labelContentHeader != nil {
            tableViewHeader.labelContentAwardsLayoutTableViewHeader.text = labelContentHeader!
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.awards.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "awardsLayoutTableViewCell", for: indexPath) as! AwardsLayoutTableViewCell
        
        cell.labelTitle.text = basicsContent?.awards[indexPath.row].title
        cell.labelAwarder.text = basicsContent?.awards[indexPath.row].awarder
        cell.labelDate.text = basicsContent?.awards[indexPath.row].date
        cell.labelSummary.text = basicsContent?.awards[indexPath.row].summary
        
        return cell
    }
}
