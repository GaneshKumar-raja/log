//
//  DeliveryCell.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import UIKit
import Cartography

class DeliveryCell: UITableViewCell ,ViewStyleHandler{
    
    let descriptionLabel: Label!
    let userImage: UIImageView!
    let backView : View!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.descriptionLabel = Label()
        self.userImage = UIImageView()
        self.backView = View()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setThemeToViews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setThemeToViews(){
        self.backView.setCellBackgroundStyle()
        self.setClearBackgroundStyle()
        self.descriptionLabel.setText(style: .subTilte)
    }
    
    func addViews() {
        self.addSubview(backView)
        self.addSubview(userImage)
        self.addSubview(descriptionLabel)
        
    }
    
}

extension DeliveryCell {
    
    func setupLayout(){
        constrain(backView, self) { backView, view in
            backView.top == view.top
          backView.left == view.left
                backView.right == view.right
            backView.height == view.height - 10
        }
        
        constrain(userImage, self) { imageView, view in
            imageView.centerY == view.centerY - 5
            imageView.left == view.left + 10
            imageView.width == view.height - 30
            imageView.height == view.height - 30
        }
        
        constrain(descriptionLabel, userImage, self) { label, imageView, view in
            label.centerY == view.centerY - 5
            label.left == imageView.right + 10
            label.right == view.right
        }

    }
}
