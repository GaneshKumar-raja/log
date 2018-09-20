//
//  PopupMessage.swift
//  LogisticDemo
//
//  Created by Ganesh on 19/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import UIKit

class PopupMessage {
    var actionSheetController: UIAlertController!
    static var selfObj : PopupMessage!
    var controller :UIViewController
    
    class func getInstance(controller: UIViewController) ->PopupMessage{
        if(selfObj == nil ){
        selfObj = PopupMessage(controller: controller)
        }
        return selfObj
    }
    
    init(controller: UIViewController) {
        self.controller = controller
        actionSheetController = UIAlertController(title: GlobalText.POPUP_TITLE, message: "", preferredStyle: UIAlertControllerStyle.alert)
        actionSheetController.addAction(UIAlertAction(title: GlobalText.OK, style: UIAlertActionStyle.default, handler: doSomething))
      
    }
    
    func show(message:String){
       
     
//
        actionSheetController.message = message
        
        controller.present(actionSheetController, animated: true, completion: nil)
    }
    
    func doSomething(action: UIAlertAction) {
        actionSheetController.dismiss(animated: true, completion: nil)
    }
}

