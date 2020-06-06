//
//  MarvelHeroLibrary_MVVMTests.swift
//  MarvelHeroLibrary_MVVMTests
//
//  Created by Shawn Li on 6/1/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import XCTest
@testable import MarvelHeroLibrary_MVVM

class MarvelHeroLibrary_MVVMTests: XCTestCase
{
    var heroViewModel: MarvelHeroViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        heroViewModel = MarvelHeroViewModel(name: "iron man")
        print("Set up with error called")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        heroViewModel = nil
        print("tearDown with error called")
    }
    
//    override class func setUp()
//    {
//        print("Set up called")
//    }
//
//    override func setUp() {
//        <#code#>
//    }
    
    override class func tearDown()
    {
        print("tearDown called")
    }
    
    func testFetchData()
    {
        let heros = heroViewModel?.heroInfo
        
        XCTAssertNotNil(heros, "Fetch Data Successful")
    }

    func testFetchData2()
    {
        let heros = heroViewModel?.heroInfo
        
        XCTAssertNil(heros)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
