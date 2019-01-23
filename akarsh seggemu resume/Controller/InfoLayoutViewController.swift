//
//  InfoLayoutViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 05.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class InfoLayoutViewController: UIViewController {
    var basicsContent: Resume?
    var labelContentHeader: String?
    
    var chosenLanguage: String?
    
    lazy var data: [String] = {
        [
            locForKey("nationality")!,
            locForKey("workPermit")!,
            locForKey("dateOfBirth")!,
            locForKey("placeOfBirth")!
        ]
    }()
    
    
    @IBOutlet var viewHeader: InfoLayoutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setInfoLayoutHeader()
    }
    
    // returns the translated string based on the chosen language
    func locForKey(_ key: String) -> String? {
        guard let path = Bundle.main.url(forResource: "Localizable", withExtension: "strings", subdirectory: nil, localization: chosenLanguage!) else {
            return nil
        }
        guard let dict = NSDictionary(contentsOf: path) else {
            return nil
        }
        return dict.value(forKey: key) as? String
    }
    
    
    func setInfoLayoutHeader() {
        // set the view header
        if labelContentHeader != nil {
            viewHeader.labelInfoLayoutHeader.text = labelContentHeader!
        }
        
        if basicsContent?.basics.info != nil {
            viewHeader.labelNationality.text = data[0]
            viewHeader.labelWorkPermit.text = data[1]
            viewHeader.labelDateOfBirth.text = data[2]
            viewHeader.labelPlaceOfBirth.text = data[3]
            
            viewHeader.labelNationalityContent.text = basicsContent?.basics.info.nationality
            viewHeader.labelWorkPermitContent.text = basicsContent?.basics.info.workPermit
            viewHeader.labelDateOfBirthContent.text = basicsContent?.basics.info.dateOfBirth
            viewHeader.labelPlaceOfBirthContent.text = basicsContent?.basics.info.placeOfBirth
        }
    }
    
}
