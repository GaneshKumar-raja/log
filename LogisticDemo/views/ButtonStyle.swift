//
//  ButtonStyle.swift
//  LogisticDemo
//
//  Created by Ganesh on 19/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import UIKit

enum ButtonStyle :Int{
    case backButtonStyle
}

protocol ButtonStyleHandler {
    
}

//  imageview background style
extension ButtonStyleHandler where  Self: UIButton{
    
    func setBackButtonStyle(){
        setImage(UIImage(named: GLobalImages.backButton), for: .normal)
    }
    
}
