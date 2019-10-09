//
//  NY_TimesTests.swift
//  NY-TimesTests
//
//  Created by Alfoah IOS on 03/10/2019.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import XCTest
@testable import NY_Times

class NY_TimesTests: XCTestCase {

    func testHello(){
        var helloWorld:String!
        XCTAssertNil(helloWorld)

        helloWorld = "Hello"

        XCTAssertEqual(helloWorld, "Hello")
    }
    
    func testRequest(){
        
    }
    

}

