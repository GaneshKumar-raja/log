//
//  ImageView.swift
//  LogisticDemo
//
//  Created by Ganesh on 19/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import UIKit

class Button : UIButton , ButtonStyleHandler{
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame : CGRect.zero)
    }
    
    func set(style : ButtonStyle){
        switch style {
        case .backButtonStyle:
            setBackButtonStyle()
            break
        }
    }
}
