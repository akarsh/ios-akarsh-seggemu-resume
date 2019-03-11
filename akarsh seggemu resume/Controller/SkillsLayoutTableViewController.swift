//
//  SkillsLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class SkillsLayoutTableViewController: UITableViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    @IBOutlet var tableViewHeader: SkillsLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        setSkillsTableViewHeader()
    }
    
    func setSkillsTableViewHeader() {
        // set table view header
        if labelContentHeader != nil {
            tableViewHeader?.labelSkillsLayoutTableViewHeader.text = labelContentHeader!
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.skills.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "skillsLayoutTableViewCell", for: indexPath) as? SkillsLayoutTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
        cell.textLabel?.text = basicsContent?.skills[indexPath.row].name
        cell.detailTextLabel?.text = (basicsContent?.skills[indexPath.row].keywords.joined(separator: ", "))!
        return cell
    }
}
