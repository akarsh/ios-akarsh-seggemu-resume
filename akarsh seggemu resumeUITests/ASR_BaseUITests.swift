//
//  ASR_BaseUITests.swift
//  akarsh seggemu resumeUITests
//
//  Created by Akarsh Seggemu on 16.03.19.
//  Copyright © 2019 Akarsh Seggemu. All rights reserved.
//

import XCTest

class ASR_BaseUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    override func tearDown() {
    }
}
