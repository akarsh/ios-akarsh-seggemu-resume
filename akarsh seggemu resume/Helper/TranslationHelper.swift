//
//  TranslationHelper.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 24/01/2019.
//  Copyright © 2019 Akarsh Seggemu. All rights reserved.
//

import Foundation

class TranslationHelper {
    // returns the translated string based on the chosen language
    static func locForKey(_ chosenLanguage: String?, _ key: String) -> String? {
        guard let path = Bundle.main.url(forResource: "Localizable", withExtension: "strings", subdirectory: nil, localization: chosenLanguage!) else {
            return nil
        }
        guard let dict = NSDictionary(contentsOf: path) else {
            return nil
        }
        return dict.value(forKey: key) as? String
    }
}
