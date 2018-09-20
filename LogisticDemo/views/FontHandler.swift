//
//  FontHandler.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import UIKit

protocol FontHandler {
    
}

extension FontHandler where Self : UILabel {
    
    func setFont(){
        let customFont = UIFont(name: GlobalText.FONT_NAME, size: UIFont.systemFontSize)
        self.font = customFont
        
    }
}
