//
//  HeaderView.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import UIKit
import Cartography

class HeaderView: View {
    var titleLbel : Label!
    var backButton : Button!
   var onBackButtonClicked : ( ) -> ()
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(onBackButtonClicked : @escaping ( ) -> ()){
        self.onBackButtonClicked = onBackButtonClicked
         super.init()
        initAllViews()
        setThemeToViews()
    }
 
    func set(title :String){
        titleLbel.text = title
    }
    
    func backButton(isHidden : Bool){
        backButton.isHidden = isHidden
    }
    
    func initAllViews(){
        titleLbel = Label()
        backButton = Button()
        addSubview(titleLbel)
        addSubview(backButton)
        setLayout()
        backButton.addTarget(self, action: #selector(self.backButtonClicked(_:)), for: .touchUpInside)
        
        
    }
    
    func setThemeToViews(){
        self.setHeaderBackgroundStyle()
        titleLbel.setText(style: .title)
        backButton.set(style: .backButtonStyle)
    }
    
   @objc func backButtonClicked(_ sender : Any){
   onBackButtonClicked()
    }
    
}

// setting layout to all the views of Headerview
extension HeaderView {
    
    func setLayout(){
        constrain(titleLbel,self) { titleLbel,selfView in
            titleLbel.centerX == selfView.centerX
            titleLbel.centerY == selfView.centerY
        }
        
        constrain(backButton,self) { backButton,selfView in
            backButton.centerY == selfView.centerY
            backButton.left == selfView.left + 10
            backButton.width == 35
            backButton.height == 35
        }
    }
}
