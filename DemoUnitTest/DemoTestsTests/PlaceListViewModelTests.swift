//
//  PlaceListViewModelTests.swift
//  DemoTestsTests
//
//  Created by Abhisek on 6/16/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import XCTest
@testable import DemoTests

class PlaceListViewModelTests: XCTestCase {
    
    var placeListSUT: PlaceListViewModel!
    var mockPlaceDataFetcher: MockPlaceDataFetcher!
    
    override func setUp() {
        super.setUp()
        placeListSUT = PlaceListViewModel(dataFetcher: MockPlaceDataFetcher())
        mockPlaceDataFetcher = MockPlaceDataFetcher()
        placeListSUT.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
        placeListSUT = nil
        mockPlaceDataFetcher = nil
    }
    
    func testOutputAttributes() {
        let tableModel = tableDataModel()
        XCTAssertEqual(placeListSUT.numberOfRows, tableModel.count)
        XCTAssertEqual(placeListSUT.title, "Place List")
    }
    
    func testDataModelForIndexPath() {
        let tableModel = tableDataModel()
        let indexPath = IndexPath(row: 0, section: 0)
        XCTAssertEqual(tableModel[0], placeListSUT.tableCellDataModelForIndexPath(indexPath))
    }
    
    func tableDataModel() -> [PlaceCellDataModel] {
        var dataModel = [PlaceCellDataModel]()
        for place in mockPlaceDataFetcher.places {
            dataModel.append(PlaceCellDataModel(place: place))
        }
        return dataModel
    }
    
}

// MARK: MockPlaceDataFetcher
/// A mock for data fetcher to provide test data.
class MockPlaceDataFetcher: PlaceDataFetcherProtocol {
    
    var places = [Place]()
    
    init() {
        let firstPlace = Place(attributes: ["name": "Cafe De Latina", "vicinity": "Bengaluru", "rating": 3.0, "opening_hours": ["open_now": false]])
        places.append(firstPlace)
        let secondPlace = Place(attributes: ["name": "Hotel Taj", "vicinity": "Mumbai", "rating": 4.8, "opening_hours": ["open_now": true]])
        places.append(secondPlace)
    }
    
    func fetchPlaces(completion: ([Place]?,_ errorMessage: String?)->()) {
        completion(places, nil)
    }
    
}



