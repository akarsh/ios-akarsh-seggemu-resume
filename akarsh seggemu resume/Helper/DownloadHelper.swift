//
//  DownloadHelper.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 24/01/2019.
//  Copyright © 2019 Akarsh Seggemu. All rights reserved.
//

import Foundation

class DownloadHelper {
    // Download file from the URL and store it in the destination File URL
    fileprivate static func downloadData(_ sessionConfig: URLSession, _ request: URLRequest, _ destinationFileUrl: URL) {
        // download task to download the resume JSON file
        let dataTask = sessionConfig.downloadTask(with: request) { data, _, error in
            if let tempLocalUrl = data, error == nil {
                // if success print the status code of 200
                //                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                //                        print("Successfully downloaded. Status code: \(statusCode)")
                //                    }
                do {
                    // copying the file to the destination file path
                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                    //                        print("File created at \(destinationFileUrl)")
                } catch (let writeError) {
                    print("Error creating a file \(destinationFileUrl) : \(writeError)")
                }
            } else {
                print("Error while downloading a file: %@ \(String(describing: error?.localizedDescription))")
            }
        }
        dataTask.resume()
    }
    
    static func downloadFromURL(_ url: String, _ destinationFileUrl: URL) {
        guard let urlString = URL(string: url) else { return }
        let sessionConfig = URLSession(configuration: .default)
        let request = URLRequest(url: urlString)
        downloadData(sessionConfig, request, destinationFileUrl)
    }
}
