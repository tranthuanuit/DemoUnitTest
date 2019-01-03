//
//  PlaceDataFetcherProtocol.swift
//  DemoTests
//
//  Created by dev on 1/3/19.
//  Copyright © 2019 Abhisek. All rights reserved.
//

import Foundation

protocol PlaceDataFetcherProtocol {
    func fetchPlaces(completion: ([Place]?,_ errorMessage: String?)->())
}
