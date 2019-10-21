//
//  TestPasingData.swift
//  NY-TimesTests
//
//  Created by Alfoah IOS on 09/10/2019.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import XCTest
@testable import NY_Times

let kSampleArticleTitle = "Trump Retreats on Separating Families, but Thousands May Remain Apart"
let kSampleArticleCount = 1
let kSampleArticlePubDate = "2018-06-20"

class TestPasingData: XCTestCase {
    
    func testParseEmptyNewsData() {
        // giving empty data
        let data = Data()
        
        testGetArticals(data: data) { (result) in
            XCTAssertEqual(result,.failure(.noDataAvilable))
        }
        
    }
    
    func testParseNewsData() {

        // giving a sample json file
        guard let data = FileManager.readJson(forResource: "TestData") else {
            XCTAssert(false, "Can't get data from TestData.json")
            return
        }
        
        var artecaleResult : [Articale]?
        
        testGetArticals(data: data) { (result) in
            switch result {
            case .success(let articals) :
                artecaleResult = articals
            case .failure(let error):
                artecaleResult = nil
            }
        }
        testGetArticals(data: data) { (result) in
            switch result {
            case .success(let articals) :
                XCTAssertEqual(artecaleResult, articals)
            case .failure(let error):
                artecaleResult = nil
            }
        }
    }

    
    func testWrongKeyNewsData() {
        // giving a sample json file
         guard let data = FileManager.readJson(forResource: "TestWrong") else {
            XCTAssert(false, "Can't get data from WrongTestData.json")
            return
        }
        
        testGetArticals(data: data) { (result) in
            XCTAssertEqual(result,.failure(.canNotProcessData))
        }

    }

    
    func testGetArticals(data: Data?, completion: @escaping (Result<[Articale], ArticalError>)-> ()) {
            guard let jsonData = data else {
             completion(.failure(.noDataAvilable))
                return
        }
            do {
                let articalsResult = try JSONDecoder().decode(ArticalsResult.self, from: data!)
                let articals = articalsResult.results
                completion(.success(articals!))
            } catch let jsonError {
                completion(.failure(.canNotProcessData))
            }

    }
    
}

extension FileManager {
    
    static func readJson(forResource fileName: String ) -> Data? {
        
        let bundle = Bundle(for: TestPasingData.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }
        
        return nil
    }
}
