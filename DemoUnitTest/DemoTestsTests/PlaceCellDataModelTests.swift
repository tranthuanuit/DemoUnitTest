//
//  PlaceCellDataModelTests.swift
//  DemoTestsTests
//
//  Created by Abhisek on 6/16/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import XCTest
@testable import DemoTests

class PlaceCellDataModelTests: XCTestCase {
    
    var placeCellSUT: PlaceCellDataModel!
    var place: Place!
    
    override func setUp() {
        super.setUp()
        let attributes: [String : Any] = ["name": "Cafe De Latina", "vicinity": "Bengaluru", "rating": 4.8, "opening_hours": ["open_now": false]]
        place = Place(attributes: attributes)
        placeCellSUT = PlaceCellDataModel(place: place)
    }
    
    override func tearDown() {
        super.tearDown()
        placeCellSUT = nil
        place = nil
    }
    
    func testAttributes() {
        // Attributes should not be nil
        XCTAssertNotNil(placeCellSUT.name, "Name is nil in PlaceCellDataModel")
        XCTAssertNotNil(placeCellSUT.address, "Address is nil in PlaceCellDataModel")
        XCTAssertNotNil(placeCellSUT.openStatusText, "OpenStatus is nil in PlaceCellDataModel")
        XCTAssertNotNil(placeCellSUT.rating, "Rating is nil in PlaceCellDataModel")
        
        // Test if the attributes have the same desired value as they should have.
        XCTAssertEqual(placeCellSUT.name, place.name)
        XCTAssertEqual(placeCellSUT.address, place.address)
        XCTAssertEqual(placeCellSUT.rating, place.rating?.description)
        
        guard let isOpen = place.openStatus else {
            XCTFail("OpenStatus is nil in PlaceCellDataModel")
            return
        }
        let openStatusText = isOpen ? "We are open. Hop in now!!" : "Sorry we are closed."
        XCTAssertEqual(placeCellSUT.openStatusText, openStatusText)
    }
    
}
