//
//  VolunteerLayoutTableViewCell.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class VolunteerLayoutTableViewCell: UITableViewCell {
    @IBOutlet weak var labelOrganisation: UILabel!
    @IBOutlet weak var labelPosition: UILabel!
    @IBOutlet weak var labelWebsite: UILabel!
    @IBOutlet weak var labelStartDate: UILabel!
    @IBOutlet weak var labelEndDate: UILabel!
    @IBOutlet weak var labelSummary: UILabel!
    @IBOutlet weak var labelHighlights: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
