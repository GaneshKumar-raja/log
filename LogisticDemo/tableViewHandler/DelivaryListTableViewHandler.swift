//
//  DelivaryListTableViewHandler.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import Foundation
import UIKit
import Cartography
import Kingfisher

class DeliveryListTableViewHandler : NSObject, UITableViewDelegate,UITableViewDataSource {
    var data : [DeliveryModelElement]!
    var tableView : UITableView!
    var onSelected : ( _ item : DeliveryModelElement) -> ()
    
    init(tableView : UITableView ,data : [DeliveryModelElement], onSelected : @escaping (_ item : DeliveryModelElement) -> ()) {
        self.tableView = tableView
        self.onSelected = onSelected
        self.data = data
        super.init()
        registerTableView()
        setTableViewDelegate()
        tableView.reloadData()
    }
    
    func registerTableView(){
        tableView.register(DeliveryCell.self, forCellReuseIdentifier: "deliveryCell")
    }
    
    func setTableViewDelegate(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier:  "deliveryCell", for: indexPath) as! DeliveryCell
       let modelData  = data[indexPath.row]
        cell.descriptionLabel.text =  modelData.description
       let url = URL(string: modelData.imageURL)
        cell.userImage.kf.setImage(with: url)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelected(data[indexPath.row])
    }
    
}
