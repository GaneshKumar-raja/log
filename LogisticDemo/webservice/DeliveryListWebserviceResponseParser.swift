//
//  DeliveryListWebserviceResponseParser.swift
//  LogisticDemo
//
//  Created by Ganesh on 17/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
protocol DeliveryListWebserviceResponseParser {
   
}

extension DeliveryListWebserviceResponseParser{
    func parseDelivaryListFrom (data : Data ) throws -> DeliveryModel{
        do{
            let coder = JSONDecoder()
            let resultArray = try coder.decode(DeliveryModel.self, from: data )
            return resultArray
        }
        catch let error {
           throw  error
        }
    }
}
