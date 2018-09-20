//
//  Connectivity.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
