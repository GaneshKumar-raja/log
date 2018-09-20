//
//  ViewController.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import UIKit
import Cartography

class BaseViewController: UIViewController {
    var topView : HeaderView!
    var alertController : UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillLayoutSubviews() {
        self.navigationController!.navigationBar.isHidden = true
    }
    
    func initTopViews(){
        topView = HeaderView(onBackButtonClicked: {
            // when back button pressed  viewcontroller 
            self.navigationController?.popViewController(animated: true)
        })
        self.view.addSubview(topView)
        setLayout()
    }
    
    func show(message : String){
        print(message)
        PopupMessage.getInstance(controller: self).show(message: message)

    }
    
   
    
}

// setup layout to top view
extension BaseViewController{
    
    func setLayout(){
        constrain(topView,self.view){ topView,selfView in
            topView.top == selfView.top  + 24
            topView.width == selfView.width
            topView.height == ((10 / 100.00 ) * selfView.height )
        }
        
    }
}


// pushing and pop viewcontrollers
extension BaseViewController{
    func goToNext(controller: BaseViewController){
        self.navigationController!.pushViewController(controller, animated: true)
    }
}

