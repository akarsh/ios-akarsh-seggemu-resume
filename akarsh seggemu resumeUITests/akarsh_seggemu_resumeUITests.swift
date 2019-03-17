//
//  akarsh_seggemu_resumeUITests.swift
//  akarsh seggemu resumeUITests
//
//  Created by Akarsh Seggemu on 23.01.19.
//  Copyright © 2019 Akarsh Seggemu. All rights reserved.
//

import XCTest

class akarsh_seggemu_resumeUITests: ASR_BaseUITests {
    let resumeMainCellContent = [
        "English resume",
        "Deutsch Lebenslauf"
    ]
    let resumeNavigationBarsContent = [
        "akarsh_seggemu_resume.ContactLayoutView",
        "akarsh_seggemu_resume.InfoLayoutView",
        "akarsh_seggemu_resume.SummaryLayoutView",
        "akarsh_seggemu_resume.ProfilesLayoutTableView",
        "akarsh_seggemu_resume.SkillsLayoutTableView",
        "akarsh_seggemu_resume.LanguagesLayoutTableView",
        "akarsh_seggemu_resume.EducationLayoutTableView",
        "akarsh_seggemu_resume.ExperienceLayoutTableView",
        "akarsh_seggemu_resume.VolunteerLayoutTableView",
        "akarsh_seggemu_resume.AwardsLayoutTableView",
        "akarsh_seggemu_resume.PublicationsLayoutTableView",
        "akarsh_seggemu_resume.InterestsLayoutTableView",
        "akarsh_seggemu_resume.ReferencesLayoutTableView"
    ]
    let englishResumeCellContent = [
        "Contact",
        "Info",
        "Summary",
        "Profiles",
        "Skills",
        "Languages",
        "Education",
        "Experience",
        "Volunteer",
        "Awards",
        "Publications",
        "Interests",
        "References"
    ]
    let deutschLebenslaufCellContent = [
        "Kontakt",
        "Info",
        "Zusammenfassung",
        "Profil",
        "Fähigkeiten",
        "Sprachen",
        "Ausbildung",
        "Berufserfahrung",
        "Gemeinnützig",
        "Auszeichnung",
        "Publikation",
        "Interessen",
        "Referenzen"
    ]
    func testNavigationintoIntoEnglishResume() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts[resumeMainCellContent[0]].tap()
        for (index, element) in englishResumeCellContent.enumerated() {
            tablesQuery.staticTexts[element].tap()
            app.navigationBars[resumeNavigationBarsContent[index]].buttons["Back"].tap()
        }
    }
    func testNavigationintoIntoDeutschLebenslauf() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery.staticTexts[resumeMainCellContent[1]].tap()
        for (index, element) in deutschLebenslaufCellContent.enumerated() {
            tablesQuery.staticTexts[element].tap()
            app.navigationBars[resumeNavigationBarsContent[index]].buttons["Back"].tap()
        }
    }
}
