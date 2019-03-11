//
//  PublicationsLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class PublicationsLayoutTableViewController: UITableViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    @IBOutlet var tableViewHeader: PublicationsLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        setPublicationsLayoutTableViewHeader()
    }
    
    // set the table view header
    func setPublicationsLayoutTableViewHeader() {
        if labelContentHeader != nil {
            tableViewHeader.labelContentPublicationsLayoutTableViewHeader.text = labelContentHeader!
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.publications.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "publicationsLayoutTableViewCell", for: indexPath) as? PublicationsLayoutTableViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }
        
        cell.labelName.text = basicsContent?.publications[indexPath.row].name
        cell.labelPublisher.text = basicsContent?.publications[indexPath.row].publisher
        cell.labelReleaseDate.text = basicsContent?.publications[indexPath.row].releaseDate
        cell.labelWebsite.text = basicsContent?.publications[indexPath.row].website
        cell.labelSummary.text = basicsContent?.publications[indexPath.row].summary
        
        return cell
    }
}
