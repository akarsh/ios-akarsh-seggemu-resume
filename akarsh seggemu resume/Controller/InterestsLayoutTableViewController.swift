//
//  InterestsLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class InterestsLayoutTableViewController: UITableViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    @IBOutlet var tableViewHeader: InterestsLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        setInterestsLayoutTableViewHeader()
    }
    
    // set the table view header
    func setInterestsLayoutTableViewHeader() {
        if labelContentHeader != nil {
            tableViewHeader.labelContentInterestsLayoutTableViewHeader.text = labelContentHeader!
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.interests.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "interestsLayoutTableViewCell", for: indexPath) as? InterestsLayoutTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
        cell.textLabel?.text = basicsContent?.interests[indexPath.row].name
        cell.detailTextLabel?.text = (basicsContent?.interests[indexPath.row].keywords.joined(separator: ", "))!
        
        return cell
    }
}
