//
//  ViewStyle.swift
//  LogisticDemo
//
//  Created by Ganesh on 18/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import UIKit

enum ViewStyle :Int{
    case headerBackgroundStyle
    case cellBackgroundStyle
    case clearBackgroundStyle
 
   
}
protocol ViewStyleHandler {
    
}

//  view and sub class of view  controles setting up background style
extension ViewStyleHandler where  Self: UIView{
    
    func setHeaderBackgroundStyle(){
        backgroundColor = GLobalColors.orange_1
    }
    
    func setCellBackgroundStyle(){
        backgroundColor = GLobalColors.gray_1
        
    }
  
    func setClearBackgroundStyle(){
         backgroundColor = UIColor.clear
    }
    
    
}



