//
//  contactLayoutViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 05.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class contactLayoutViewController: UIViewController, LabelHeader {
    var labelContentHeader: String?
    
    @IBOutlet var viewHeader: contactLayoutView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setContactViewHeader()
    }
    
    // set the view header
    func setContactViewHeader() {
        if labelContentHeader != nil {
            viewHeader.labelContactLayoutHeader.text = labelContentHeader!
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
