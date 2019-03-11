//
//  ExperienceLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class ExperienceLayoutTableViewController: UITableViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    @IBOutlet var tableViewHeader: ExperienceLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        setExperienceLayoutTableViewHeader()
    }
    
    // set the table view header
    func setExperienceLayoutTableViewHeader() {
        if labelContentHeader != nil {
            tableViewHeader.labelContentExperienceLayoutTableViewHeader.text = labelContentHeader!
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.work.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "experienceLayoutTableViewCell", for: indexPath) as? ExperienceLayoutTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
        cell.labelCompany.text = basicsContent?.work[indexPath.row].company
        cell.labelPosition.text = basicsContent?.work[indexPath.row].position
        cell.labelWebsite.text = basicsContent?.work[indexPath.row].website
        cell.labelStartDate.text = basicsContent?.work[indexPath.row].startDate
        cell.labelEndDate.text = basicsContent?.work[indexPath.row].endDate
        
        if (basicsContent?.work[indexPath.row].highlights.count)! != 0 {
            // adding attributes to the attributed text
            var attributes = [NSAttributedString.Key: Any]()
            // setting the head indent for the paragraph style
            let paragraphStyle = NSMutableParagraphStyle()
            // "unicode character plus space" as string
            paragraphStyle.headIndent = ("\u{2022} " as NSString).size(withAttributes: attributes).width
            attributes[.paragraphStyle] = paragraphStyle
            // "a bullet point is added to the string" as string
            // array of strings are joined with the separator two newline spaces followed by bullet point
            cell.labelHighlights.attributedText = NSAttributedString(string: "\u{2022} \((basicsContent?.work[indexPath.row].highlights.joined(separator: "\n\n\u{2022} "))!)", attributes: attributes)
        }
        
        return cell
    }
}
