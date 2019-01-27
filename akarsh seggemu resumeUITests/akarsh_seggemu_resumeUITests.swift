//
//  akarsh_seggemu_resumeUITests.swift
//  akarsh seggemu resumeUITests
//
//  Created by Akarsh Seggemu on 23.01.19.
//  Copyright © 2019 Akarsh Seggemu. All rights reserved.
//

import XCTest

class akarsh_seggemu_resumeUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationintoIntoEnglishResume() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["English resume"]/*[[".cells.staticTexts[\"English resume\"]",".staticTexts[\"English resume\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Contact"]/*[[".cells.staticTexts[\"Contact\"]",".staticTexts[\"Contact\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.ContactLayoutView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Info"]/*[[".cells.staticTexts[\"Info\"]",".staticTexts[\"Info\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.InfoLayoutView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Summary"]/*[[".cells.staticTexts[\"Summary\"]",".staticTexts[\"Summary\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.SummaryLayoutView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Profiles"]/*[[".cells.staticTexts[\"Profiles\"]",".staticTexts[\"Profiles\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.ProfilesLayoutTableView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Skills"]/*[[".cells.staticTexts[\"Skills\"]",".staticTexts[\"Skills\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.SkillsLayoutTableView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Languages"]/*[[".cells.staticTexts[\"Languages\"]",".staticTexts[\"Languages\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.LanguagesLayoutTableView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Education"]/*[[".cells.staticTexts[\"Education\"]",".staticTexts[\"Education\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.EducationLayoutTableView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Experience"]/*[[".cells.staticTexts[\"Experience\"]",".staticTexts[\"Experience\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.ExperienceLayoutTableView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Volunteer"]/*[[".cells.staticTexts[\"Volunteer\"]",".staticTexts[\"Volunteer\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.VolunteerLayoutTableView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Awards"]/*[[".cells.staticTexts[\"Awards\"]",".staticTexts[\"Awards\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.AwardsLayoutTableView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Publications"]/*[[".cells.staticTexts[\"Publications\"]",".staticTexts[\"Publications\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.PublicationsLayoutTableView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Interests"]/*[[".cells.staticTexts[\"Interests\"]",".staticTexts[\"Interests\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.InterestsLayoutTableView"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["References"]/*[[".cells.staticTexts[\"References\"]",".staticTexts[\"References\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["akarsh_seggemu_resume.ReferencesLayoutTableView"].buttons["Back"].tap()
        
    }

}
