//
//  ReferencesLayoutTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class ReferencesLayoutTableViewController: UITableViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    
    @IBOutlet weak var tableViewHeader: ReferencesLayoutTableViewHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        
        self.setReferencesLayoutTableViewHeader()
    }
    
    // set the table view header
    func setReferencesLayoutTableViewHeader() {
        if labelContentHeader != nil {
            tableViewHeader.labelContentReferencesLayoutTableViewHeader.text = labelContentHeader!
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicsContent?.references.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "referencesLayoutTableViewCell", for: indexPath) as? ReferencesLayoutTableViewCell  else {
            fatalError("DequeueReusableCell failed while casting")
        }
        cell.textLabel?.text = basicsContent?.references[indexPath.row].name
        cell.detailTextLabel?.text = basicsContent?.references[indexPath.row].reference
        
        return cell
    }
}
