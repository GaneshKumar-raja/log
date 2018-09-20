//
//  Label.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import UIKit

class Label : UILabel,FontHandler {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame : CGRect.zero)
        setFont()
    }
    
}

extension Label:TextStyleHandler {
    
    func setText(style : TextStyle){
        
        switch style {
        case .title:
            setTitleStyle()
            break
        case .subTilte:
            setSubTitleStyle()
            break
        case .description:
            setDescriptionStyle()
            break
        }
    }
}

