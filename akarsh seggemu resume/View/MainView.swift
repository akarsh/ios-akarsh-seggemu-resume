//
//  MainView.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 03.03.21.
//  Copyright © 2021 Akarsh Seggemu. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var languages = [
        Language(name: "English resume", flag: "flagUnitedKingdom", code: "en"),
        Language(name: "Deutsch Lebenslauf", flag: "flagGermany", code: "de")
    ]
    @State private var code = ""
    @State private var languageCode = ""
    // Filenames for the resume JSON files
    let englishResumeFile = "englishResume.json"
    let germanResumeFile = "deutschResume.json"
    // empty file path declaration
    @State var filePath = ""
    // URLs for the resume JSON files located in GitHub
    let englishResumeURL = "https://raw.githubusercontent.com/akarsh/akarsh.github.io/master/json/en/resume.json"
    let germanResumeURL = "https://raw.githubusercontent.com/akarsh/akarsh.github.io/master/json/de/resume.json"
    var body: some View {
        NavigationView {
            List(languages, id: \.id) { language in
                HStack(alignment: .center, spacing: 10) {
                    Image(language.flag)
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .scaledToFit()
                    Text(language.name)
                        .lineLimit(1)
                        .frame(width:160, alignment: .leading)
                }
                NavigationLink(destination: ResumeSchemaView(code: language.code, languageName: language.name)) {
                }
            }.navigationBarTitle("Akarsh Seggemu")
        }.onAppear(perform: {
            // calling fetchData to download the englishResume.json
            self.fetchData(self.englishResumeFile, self.englishResumeURL)
            self.fetchData(self.germanResumeFile, self.germanResumeURL)
        })
    }
}

extension MainView {
    // MARK: - Fetch Data to create the JSON file in the documents directory
    
    func fetchData(_ resumeFileName: String, _ resumeURL: String) {
        // Create destination URL
        let documentsUrl: URL = DocumentHelper.getDocumentsDirectory()
        // Get the file path in documents directory
        let destinationFileUrl = documentsUrl.appendingPathComponent(resumeFileName)
        // Find documents directory on device
        let dirs: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        do {
            if dirs.count > 0 {
                // documents directory
                let dir = dirs[0]
                // adding the filename to the documents directory as file path
                self.filePath = dir.appendingFormat("/" + resumeFileName)
                // delete the file if it exists
                if FileManager.default.fileExists(atPath: self.filePath) {
                    try FileManager.default.removeItem(atPath: self.filePath)
                }
            } else {
                print("Could not find local directory to store file")
                return
            }
        } catch let error as NSError {
            print("An error took place: \(error.localizedDescription)")
        }
        // url to the resume JSON file
        DownloadHelper.downloadFromURL(resumeURL, destinationFileUrl)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
