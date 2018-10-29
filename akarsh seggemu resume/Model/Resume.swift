//
//  Resume.swift
//  akarsh seggemu resume
//
//  Created by Akarsh Seggemu on 29.10.18.
//  Copyright © 2018 Akarsh Seggemu. All rights reserved.
//

import Foundation

struct basics: Codable {
    var name: String
    var label: String
    var picture: String
    var email: String
    var phone: String
    var website: String
    var summary: String
    var location: location
    var profiles: [profiles]
}

struct location: Codable {
    var address: String
    var postalCode: String
    var city: String
    var countryCode: String
    var region: String
}

struct profiles: Codable {
    var network: String
    var username: String
    var url: String
}

struct work: Codable {
    var company: String
    var position: String
    var website: String
    var startDate: String
    var endDate: String
    var summary: String
    var highlights: [String]
}

//struct volunteer: Codable {
//
//}

struct education: Codable {
    var institution: String
    var area: String
    var studyType: String
    var startDate: String
    var endDate: String
    var gpa: String
    var courses: [String]
}

//struct awards: Codable {
//
//}

//struct publications: Codable {
//
//}

struct skills: Codable {
    var name: String
    var level: String
    var keywords: [String]
}

struct languages: Codable {
    var language: String
    var fluency: String
}

//struct interests: Codable {
//
//}

//struct references: Codable {
//
//}

struct Resume: Codable {
    var basics: basics
    var work: [work]
//    var volunteer: [volunteer]
    var education: [education]
//    var awards: [awards]
//    var publications: [publications]
    var skills: [skills]
    var languages: [languages]
//    var interests: [interests]
//    var references: [references]
 
    
}
