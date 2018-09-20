//
//  DelivaryModel.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation



typealias DeliveryModel = [DeliveryModelElement]

struct DeliveryModelElement: Decodable {
    let id: Int
    let description: String
    let imageURL: String
    let location: Location
    
    enum CodingKeys: String, CodingKey {
        case id, description
        case imageURL = "imageUrl"
        case location
    }
}

struct Location: Decodable {
    let lat, lng: Double
    let address: String
}
