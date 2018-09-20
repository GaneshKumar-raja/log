//
//  View.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import UIKit



class View: UIView {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame : CGRect.zero)
    }
    
    
}

extension View :ViewStyleHandler{
    func set(style : ViewStyle){
        
        switch style {
        case .headerBackgroundStyle:
            setHeaderBackgroundStyle()
            break
        case .cellBackgroundStyle:
            setCellBackgroundStyle()
            break
        case .clearBackgroundStyle:
            setClearBackgroundStyle()
            break
      
        
    }
}
}
