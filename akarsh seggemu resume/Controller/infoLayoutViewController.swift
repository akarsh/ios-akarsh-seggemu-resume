//
//  infoLayoutViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 05.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class infoLayoutViewController: UIViewController, LabelHeader {
    var labelContentHeader: String?
    
    @IBOutlet var viewHeader: infoLayoutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setInfoLayoutHeader()
    }
    
    // set the view header
    func setInfoLayoutHeader() {
        if labelContentHeader != nil {
            viewHeader.labelInfoLayoutHeader.text = labelContentHeader!
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
