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
    
    // file path
    var filePath = ""
    
    let imageFileName = "standard_profile.jpg"
    
    @IBOutlet var viewHeader: ContactLayoutView!
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
            if basicsContent?.basics.picture != nil {
                self.setImageViewToImageFile()
            }
            
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
    
    // read the picture data file
    func setImageViewToImageFile() {
        // Find documents directory on device
        let dirs: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        if dirs.count > 0 {
            // documents directory
            let dir = dirs[0]
            // adding the filename to the documents directory as file path
            self.filePath = dir.appendingFormat("/" + self.imageFileName)
            // set the file to imageView
            self.viewHeader.imageViewProfilePicture.image = UIImage(contentsOfFile: filePath)
        } else {
            print("Could not find local directory to store file")
            return
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
