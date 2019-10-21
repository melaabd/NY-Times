//
//  NY_TimesUITests.swift
//  NY-TimesUITests
//
//  Created by El-Abd on 10/13/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import XCTest

class NY_TimesUITests: XCTestCase {

    var app: XCUIApplication!
     
       override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
           // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
       }
    
    func testTableViewShowData(){
        
        let app = XCUIApplication()
        let testCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Macabre Video of Fake Trump Shooting Media and Critics Is Shown at His Resort"]/*[[".cells.staticTexts[\"Macabre Video of Fake Trump Shooting Media and Critics Is Shown at His Resort\"]",".staticTexts[\"Macabre Video of Fake Trump Shooting Media and Critics Is Shown at His Resort\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: testCell, handler: nil)
        waitForExpectations(timeout: 2, handler: nil)
        
    }
    
    

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
