//
//  TextStyle.swift
//  LogisticDemo
//
//  Created by Ganesh on 18/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import UIKit
//values for text size and type
enum TextStyle :Int{
    case title
    case subTilte
    case description
}


protocol TextStyleHandler {
    
}

extension TextStyleHandler where  Self: UILabel{
    
    func setTitleStyle(){
         setText(color: UIColor.white, size: 24)
    }
    
    func setSubTitleStyle(){
           setText(color:GLobalColors.orange_1, size: 14)
    }
    
    func setDescriptionStyle(){
        setText(color:GLobalColors.gray_2, size: 10)
    }
    
    private func setText(color : UIColor , size : Int ){
        textColor = color
        font = UIFont(name: font.fontName, size: CGFloat(size))
    }
}
