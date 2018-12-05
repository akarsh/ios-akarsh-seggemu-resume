//
//  ResumeSchemaTableViewController.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 26.11.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import UIKit

class ResumeSchemaTableViewController: UITableViewController {
    var basicsStorage: Resume?
    
    var choosenLanguage: String?
    
    lazy var data: [String] = {
        [
            locForKey("contact")!,
            locForKey("info")!,
            locForKey("summary")!,
            locForKey("profiles")!,
            locForKey("skills")!,
            locForKey("languages")!,
            locForKey("education")!,
            locForKey("experience")!,
            locForKey("volunteer")!,
            locForKey("awards")!,
            locForKey("publications")!,
            locForKey("interests")!,
            locForKey("references")!
        ]
    }()
    
    let emojiOfSchemaKeys = ["📇", "ℹ️", "💬", "👤", "🛠", "🌐", "🎓", "⏳", "🏵", "🏆", "📚", "❤️", "📝"]
    
    let identitiesOfStoryboards = [
        "contactLayout",
        "infoLayout",
        "summaryLayout",
        "profilesLayout",
        "skillsLayout",
        "languagesLayout",
        "educationLayout",
        "experienceLayout",
        "volunteerLayout",
        "awardsLayout",
        "publicationsLayout",
        "interestsLayout",
        "referencesLayout"
    ]
    
    func locForKey(_ key: String) -> String? {
        guard let path = Bundle.main.url(forResource: "Localizable", withExtension: "strings", subdirectory: nil, localization: choosenLanguage!) else {
            return nil
        }
        guard let dict = NSDictionary(contentsOf: path) else {
            return nil
        }
        return dict.value(forKey: key) as? String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // FooterView is added so the UIKit does not create empty rows
        tableView.tableFooterView = UIView(frame: .zero)
        
        // Adding separator Inset
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        
//        self.fetchData { basicsStorage in
//            self.basicsStorage = basicsStorage
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    }
    // MARK: - Fetch Data from JSON file
//    func fetchData(completionHandler: @escaping (Resume) -> ()) {
//        let url = "https://raw.githubusercontent.com/akarsh/jsonresume-theme-onepage-simplified/master/resume.json"
//        if let urlString = URL(string: url) {
//            let session = URLSession(configuration: .ephemeral)
//            let dataTask = session.dataTask(with: urlString) { data, _, _ in
//                if let jsonData = data {
//                    // do try catch block
//                    let jsonDecoder = JSONDecoder()
//                    do {
//                        let basicsStorage = try jsonDecoder.decode(Resume.self, from: jsonData)
//                        completionHandler(basicsStorage)
//                    } catch {}
//                }
//            }
//            dataTask.resume()
//        }
//    }
}

extension ResumeSchemaTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.emojiOfSchemaKeys.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resumeSchemaTableCell", for: indexPath) as! ResumeSchemaTableViewCell
        
        cell.contentLabelOfSchemaKeys.text = data[indexPath.row]
        cell.emojiSymbolLabelOfSchemaKeys.text = emojiOfSchemaKeys[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName = identitiesOfStoryboards[indexPath.row]
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
}
