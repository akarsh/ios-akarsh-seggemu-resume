//
//  ResumeSchemaView.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 03.03.21.
//  Copyright © 2021 Akarsh Seggemu. All rights reserved.
//

import SwiftUI

struct ResumeSchemaView: View {
    var code: String?
    var languageName: String
    @State var basicsStorage: Resume?
    // Data array contains the key values which are translated according to chosen language
    // Translated values are displayed as label in the cell
    // Emoji images filenames in the array imageOfSchemaKeys
    var resumeSchemas: [ResumeSchema]
    // file path
    @State var filePath = ""
    @State var resumeFileName = ""
    // filename of the profile image
    let imageFileName = "standard_profile.jpg"
    
    var body: some View {
        List(resumeSchemas, id: \.id) { resumeSchema in
            HStack(alignment: .center, spacing: 10) {
                Image(resumeSchema.icon)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .scaledToFit()
                Text(resumeSchema.name)
                    .lineLimit(1)
                    .frame(width:160, alignment: .leading)
            }
        }.onAppear(perform: {
            
        })
    }
}

extension ResumeSchemaView {
    mutating func loadData() {
        self.resumeSchemas = [
            ResumeSchema(icon: "cardIndex", name: TranslationHelper.locForKey(code, "contact")!),
            ResumeSchema(icon: "informationSource", name: TranslationHelper.locForKey(code, "info")!),
            ResumeSchema(icon: "speechBalloon", name: TranslationHelper.locForKey(code, "summary")!),
            ResumeSchema(icon: "bustInSilhouette", name: TranslationHelper.locForKey(code, "profiles")!),
            ResumeSchema(icon: "hammerAndWrench", name: TranslationHelper.locForKey(code, "skills")!),
            ResumeSchema(icon: "globeWithMeridians", name: TranslationHelper.locForKey(code, "languages")!),
            ResumeSchema(icon: "graduationCap", name: TranslationHelper.locForKey(code, "education")!),
            ResumeSchema(icon: "hourglassWithFlowingSand", name: TranslationHelper.locForKey(code, "experience")!),
            ResumeSchema(icon: "rosette", name: TranslationHelper.locForKey(code, "volunteer")!),
            ResumeSchema(icon: "trophy", name: TranslationHelper.locForKey(code, "awards")!),
            ResumeSchema(icon: "books", name: TranslationHelper.locForKey(code, "publications")!),
            ResumeSchema(icon: "heavyBlackHeart", name: TranslationHelper.locForKey(code, "interests")!),
            ResumeSchema(icon: "memo", name: TranslationHelper.locForKey(code, "references")!)
        ]
    }
    // set the resume file name according to the chosen language
    func setResumeFileToChosenLanguage() {
        self.code == "en" ? (self.resumeFileName = "englishResume.json") : (self.resumeFileName = "deutschResume.json")
        self.readData { basicsStorage in
            self.basicsStorage = basicsStorage
            self.downloadImageFromURL()
        }
    }
    // read the JSON data file
    func readData(completionHandler: @escaping (Resume) -> Void) {
        // Find documents directory on device
        let dirs: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        
        do {
            if dirs.count > 0 {
                // documents directory
                let dir = dirs[0]
                // adding the filename to the documents directory as file path
                self.filePath = dir.appendingFormat("/" + self.resumeFileName)
                // Read file content
                let contentFromFile = try String(contentsOfFile: self.filePath, encoding: String.Encoding.utf8)
                let jsonDataParsed = contentFromFile.data(using: .utf8)!
                let jsonDecoder = JSONDecoder()
                do {
                    let basicsStorage = try jsonDecoder.decode(Resume.self, from: jsonDataParsed)
                    completionHandler(basicsStorage)
                } catch {}
            } else {
                print("Could not find local directory to store file")
                return
            }
        } catch let error as NSError {
            print("An error took place: \(error)")
        }
    }
    
    func downloadImageFromURL() {
        guard let url = basicsStorage?.basics.picture else { return }
        // Create destination URL
        let documentsUrl: URL = DocumentHelper.getDocumentsDirectory()
        // Get the file path in documents directory
        let destinationFileUrl = documentsUrl.appendingPathComponent(self.imageFileName)
        // get the documents directory url
        let dirs: [String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        if dirs.count > 0 {
            // documents directory
            let dir = dirs[0]
            // adding the filename to the documents directory as file path
            self.filePath = dir.appendingFormat("/" + self.imageFileName)
            // check if the file does not exists
            if !FileManager.default.fileExists(atPath: self.filePath) {
                // url to the resume JSON file
                DownloadHelper.downloadFromURL(url, destinationFileUrl)
            }
        } else {
            print("Could not find local directory to store file")
            return
        }
    }
}

struct ResumeSchemaView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeSchemaView(code: "", languageName: "")
    }
}
