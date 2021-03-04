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
    @State private var code = 0
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
                NavigationLink(destination: ResumeSchemaView(code: language.code)) {
                }
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
