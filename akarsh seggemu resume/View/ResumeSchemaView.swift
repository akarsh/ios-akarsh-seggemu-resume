//
//  ResumeSchemaView.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 03.03.21.
//  Copyright © 2021 Akarsh Seggemu. All rights reserved.
//

import SwiftUI

struct ResumeSchemaView: View {
    var code: String
    var body: some View {
        Text(self.code)
    }
}

struct ResumeSchemaView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeSchemaView(code: "")
    }
}
