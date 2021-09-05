//
//  ResumeSchema.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 04.03.21.
//  Copyright © 2021 Akarsh Seggemu. All rights reserved.
//

import SwiftUI

struct ResumeSchema: Identifiable {
    /// unqiue id
    var id: String = UUID().uuidString
    var icon: String
    var name: String
    /// Init
    init(icon: String, name: String) {
        self.icon = icon
        self.name = name
    }
}
