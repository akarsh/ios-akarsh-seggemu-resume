//
//  ProfilesLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 14/12/2018.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class ProfilesLayoutTableViewController: UITableViewController, LabelHeader {
    
    var basicsContent: Resume?
    var labelContentHeader: String?
    
    @IBOutlet weak var tableViewHeader: ProfilesLayoutTableViewHeader!
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
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        
        self.setProfilesTableViewHeader()
    }
    
    func setProfilesTableViewHeader() {
        // set table view header
        if labelContentHeader != nil {
            tableViewHeader?.labelProfilesLayoutTableViewHeader.text = labelContentHeader!
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.basics.profiles.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilesLayoutTableViewCell", for: indexPath) as! ProfilesLayoutTableViewCell

        if basicsContent?.basics.profiles[indexPath.row].network.lowercased() == "twitter" {
            cell.imageViewNetwork.image = UIImage(named: "Twitter_Logo_WhiteOnBlue")
            cell.labelUsername.text = basicsContent?.basics.profiles[indexPath.row].username
        } else if basicsContent?.basics.profiles[indexPath.row].network.lowercased() == "linkedin" {
            cell.imageViewNetwork.image = UIImage(named: "In-2C-128px-TM")
            cell.labelUsername.text = basicsContent?.basics.profiles[indexPath.row].username
        } else if basicsContent?.basics.profiles[indexPath.row].network.lowercased() == "github" {
            cell.imageViewNetwork.image = UIImage(named: "GitHub")
            cell.labelUsername.text = basicsContent?.basics.profiles[indexPath.row].username
        } else if basicsContent?.basics.profiles[indexPath.row].network.lowercased() == "stackoverflow" {
            cell.imageViewNetwork.image = UIImage(named: "stackoverflow")
            cell.labelUsername.text = basicsContent?.basics.profiles[indexPath.row].username
        } else if basicsContent?.basics.profiles[indexPath.row].network.lowercased() == "duolingo" {
            cell.imageViewNetwork.image = UIImage(named: "duo")
            cell.labelUsername.text = basicsContent?.basics.profiles[indexPath.row].username
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = basicsContent?.basics.profiles[indexPath.row].url else {
            return
        }
        guard let urlString = URL(string: url) else {
            return
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(urlString, options: [:])
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(urlString)
        }
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
