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
    
    @IBOutlet weak var tableViewHeader: VolunteerLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.setVolunteerLayoutTableViewHeader()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "volunteerLayoutTableViewCell", for: indexPath) as! VolunteerLayoutTableViewCell
        
        cell.labelOrganisation.text = basicsContent?.volunteer[indexPath.row].organization
        cell.labelPosition.text = basicsContent?.volunteer[indexPath.row].position
        cell.labelWebsite.text = basicsContent?.volunteer[indexPath.row].website
        cell.labelStartDate.text = basicsContent?.volunteer[indexPath.row].startDate
        cell.labelEndDate.text = basicsContent?.volunteer[indexPath.row].endDate
        cell.labelSummary.text = basicsContent?.volunteer[indexPath.row].summary

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
        
        return cell
    }

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
