//
//  Language.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 03.03.21.
//  Copyright © 2021 Akarsh Seggemu. All rights reserved.
//

import SwiftUI

struct Language: Identifiable {
    /// unqiue id
    var id: String = UUID().uuidString
    /// language name
    let name: String
    /// language flag
    let flag: String
    /// language code
    let code: String
    /// Init
    init(name: String, flag: String, code: String) {
        self.name = name
        self.flag = flag
        self.code = code
    }
}
