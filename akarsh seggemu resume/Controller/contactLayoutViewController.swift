//
//  ContactLayoutViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 05.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class ContactLayoutViewController: UIViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?
    
    @IBOutlet var viewHeader: contactLayoutView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setContactViewHeader()
    }
    
    
    func setContactViewHeader() {
        // set the view header
        if labelContentHeader != nil {
            viewHeader.labelContactLayoutHeader.text = labelContentHeader!
        }
        if basicsContent?.basics != nil {
            
            // The picture value is a string which is a file path
            //            viewHeader.imageViewProfilePicture.image = basicsContent?.basics.picture
            
            viewHeader.labelName.text = basicsContent?.basics.name
            viewHeader.labelTitle.text = basicsContent?.basics.label
            viewHeader.labelEmail.text = basicsContent?.basics.email
            viewHeader.labelPhone.text = basicsContent?.basics.phone
            viewHeader.labelWebsite.text = basicsContent?.basics.website
            viewHeader.labelAddress.text = basicsContent?.basics.location.address
            viewHeader.labelPostalCode.text = basicsContent?.basics.location.postalCode
            viewHeader.labelCity.text = basicsContent?.basics.location.city
            viewHeader.labelCountryCode.text = basicsContent?.basics.location.countryCode
            viewHeader.labelRegion.text = basicsContent?.basics.location.region
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
