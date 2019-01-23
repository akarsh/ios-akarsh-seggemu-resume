//
//  EducationLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class EducationLayoutTableViewController: UITableViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    
    @IBOutlet weak var tableViewHeader: EducationLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setEducationLayoutTableViewHeader()
        
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
    }
    
    // set the table view header
    func setEducationLayoutTableViewHeader() {
        if labelContentHeader != nil {
            tableViewHeader.labelContentEducationLayoutTableViewHeader.text = labelContentHeader!
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.education.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "educationLayoutTableViewCell", for: indexPath) as! EducationLayoutTableViewCell
        
        cell.labelInstitution.text = basicsContent?.education[indexPath.row].institution
        cell.labelArea.text = basicsContent?.education[indexPath.row].area
        cell.labelStudyType.text = basicsContent?.education[indexPath.row].studyType
        cell.labelStartDate.text = basicsContent?.education[indexPath.row].startDate
        cell.labelEndDate.text = basicsContent?.education[indexPath.row].endDate
        cell.labelGpa.text = basicsContent?.education[indexPath.row].gpa
        
        return cell
    }
}
