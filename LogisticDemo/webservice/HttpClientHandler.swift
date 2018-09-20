//
//  HttpClientHandler.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation


import Foundation
import UIKit
import Alamofire



protocol HttpClientHander  {
    func onSuccess(httpResponsedata : Data)
    func onError(message : String )
}



extension HttpClientHander  {
    
    internal  func doRequest(url :String ) throws {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON  {
                (response ) in
                if response.result.error != nil {
                    self.onError(message :  response.result.error!.localizedDescription )
                    return
                }
                if (response.response!.statusCode != 200){
                    self.onError(message : String ("Error Code " + String (response.response!.statusCode)))
                    return
                }
                //print(response.result.value)
                switch response.result {
                case .success(let data):
                    do{
                        let responseDatat =  try JSONSerialization.data(withJSONObject: data, options: [])
                        self.onSuccess(httpResponsedata:responseDatat)
                    }
                    catch let error{
                        self.onError(message : error.localizedDescription)
                        print("Request failed with error: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    self.onError(message : error.localizedDescription)
                    
                }
        }
    }
    
    
    
    
    
    
    
}
