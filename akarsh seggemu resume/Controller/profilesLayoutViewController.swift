//
//  ProfilesLayoutViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 06.12.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class ProfilesLayoutViewController: UIViewController, LabelHeader {
    var basicsContent: Resume?
    var labelContentHeader: String?

    @IBOutlet var viewHeader: ProfilesLayoutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setProfilesLayoutViewHeader()
    }
    
    
    func setProfilesLayoutViewHeader() {
        // set the view header
        if labelContentHeader != nil {
            viewHeader.labelProfilesHeader.text = labelContentHeader!
        }
        // set the profile usernames
        if basicsContent?.basics.profiles != nil {
            // get the profiles array size
            let profileCount = basicsContent?.basics.profiles.count
            for index in 0 ..< profileCount! {
                if basicsContent?.basics.profiles[index].network == "GitHub" {
                    viewHeader.labelGithub.text = basicsContent?.basics.profiles[index].username
                }
                
                if basicsContent?.basics.profiles[index].network == "Twitter" {
                    viewHeader.labelTwitter.text = basicsContent?.basics.profiles[index].username
                }
                
                if basicsContent?.basics.profiles[index].network == "LinkedIn" {
                    viewHeader.labelLinkedin.text = basicsContent?.basics.profiles[index].username
                }
                
                if basicsContent?.basics.profiles[index].network == "stackoverflow" {
                    viewHeader.labelStackoverflow.text = basicsContent?.basics.profiles[index].username
                }
            }
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
