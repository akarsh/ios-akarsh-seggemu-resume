//
//  VolunteerLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class VolunteerLayoutTableViewController: UITableViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    
    @IBOutlet var tableViewHeader: VolunteerLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        setVolunteerLayoutTableViewHeader()
    }
    
    // set the table view header
    func setVolunteerLayoutTableViewHeader() {
        if labelContentHeader != nil {
            tableViewHeader.labelContentVolunteerLayoutTableViewHeader.text = labelContentHeader!
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.volunteer.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "volunteerLayoutTableViewCell", for: indexPath) as? VolunteerLayoutTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
        cell.labelOrganisation.text = basicsContent?.volunteer[indexPath.row].organization
        cell.labelPosition.text = basicsContent?.volunteer[indexPath.row].position
        cell.labelWebsite.text = basicsContent?.volunteer[indexPath.row].website
        cell.labelStartDate.text = basicsContent?.volunteer[indexPath.row].startDate
        cell.labelEndDate.text = basicsContent?.volunteer[indexPath.row].endDate
        cell.labelSummary.text = basicsContent?.volunteer[indexPath.row].summary
        
        if (basicsContent?.volunteer[indexPath.row].highlights.count)! != 0 {
            // adding attributes to the attributed text
            var attributes = [NSAttributedString.Key: Any]()
            // setting the head indent for the paragraph style
            let paragraphStyle = NSMutableParagraphStyle()
            // "unicode character plus space" as string
            paragraphStyle.headIndent = ("\u{2022} " as NSString).size(withAttributes: attributes).width
            attributes[.paragraphStyle] = paragraphStyle
            // "a bullet point is added to the string" as string
            // array of strings are joined with the separator two newline spaces followed by bullet point
            cell.labelHighlights.attributedText = NSAttributedString(string: "\u{2022} \((basicsContent?.volunteer[indexPath.row].highlights.joined(separator: "\n\n\u{2022} "))!)", attributes: attributes)
        }
        
        return cell
    }
}
