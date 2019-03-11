//
//  MainTableViewCell.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 22.11.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet var imageOfLanguage: UIImageView!
    @IBOutlet var nameLabelOfLanguage: UILabel!
    var languageCode: String!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
