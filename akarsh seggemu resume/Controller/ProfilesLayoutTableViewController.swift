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
    // array of network names
    let networkNames = [
        "twitter",
        "linkedin",
        "github",
        "stackoverflow",
        "duolingo",
        "xing"
    ]
    // array of containing network images
    let imagesOfNetworks = [
        "Twitter_Logo_WhiteOnBlue",
        "In-2C-128px-TM",
        "GitHub",
        "stackoverflow",
        "duo",
        "XNG"
    ]
    @IBOutlet var tableViewHeader: ProfilesLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        // Adding separator Inset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        setProfilesTableViewHeader()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilesLayoutTableViewCell", for: indexPath) as? ProfilesLayoutTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
        if basicsContent?.basics.profiles[indexPath.row].network.lowercased() == networkNames[indexPath.row] {
            cell.imageViewNetwork.image = UIImage(named: imagesOfNetworks[indexPath.row])
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
}
