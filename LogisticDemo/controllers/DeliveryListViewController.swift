//
//  DeliveryListViewController.swift
//  LogisticDemo
//
//  Created by Ganesh on 16/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import UIKit
import Cartography
import Alamofire


class DeliveryListViewController: BaseViewController {
    var tableView : UITableView!
    var tableViewHandler : DeliveryListTableViewHandler!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.initTopViews()
        initAllViews()
        topView.set(title: GlobalText.HOME_SCREEN_TITLE)
        topView.backButton(isHidden : true)
         getListFromServer()
    }
    
    required
    init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
   
    
    func initAllViews(){
        tableView = UITableView()
        self.view.addSubview(tableView)
        setupLayout()
    }
    
    func loadDataToTableView(deliveryArra : [DeliveryModelElement] ){
        tableViewHandler = DeliveryListTableViewHandler(tableView: tableView,data :deliveryArra, onSelected: {  item  in
            self.showSelectedItemDetails(item: item)
        } )
    }
    
    // navigate to the view controller where the selected item details is displayed
    func showSelectedItemDetails(item : DeliveryModelElement){
        let controller = SelectedItemDetailsController(deliveryDetails: item)
        self.goToNext(controller: controller)
      
    }
    
}

// web service handler
extension DeliveryListViewController : HttpClientHander , DeliveryListWebserviceResponseParser{
    
    func getListFromServer(){
        
        do {
            // connectivity checking
            guard Connectivity.isConnectedToInternet else{
                // get data from cache while offline
                getDeliveryListFromCache()
                return
            }
           
            // do http request
            try doRequest(url: GlobalText.DELIVERY_LSIT_URL)
        }
        catch let x {
            show(message: x.localizedDescription)
        }
    }
    
    // get the delivary list from chache
    func getDeliveryListFromCache(){
        let cacheDeliveyData = UserDefaults.standard.data(forKey: GlobalText.CACHED_DATA_KEY)
        
        guard let tempCacheDelieryData = cacheDeliveyData else {
            self.show(message:GlobalText.CHECK_INTERNET_CONNECTION)
            return
        }
        
        parseDataAndLoadToTableView(data: tempCacheDelieryData)
    }
    
    //  invoked when response of http request is success
    func onSuccess( httpResponsedata: Data) {
        parseDataAndLoadToTableView(data: httpResponsedata)
    }
    
    // invoked when  error occured duo to 404 or invalid response format in http request
    func onError(message: String) {
        show(message: message)
    }
    
    // parse the delevary list from Data
    func parseDataAndLoadToTableView(data: Data){
        
        do{
            let resultArray = try parseDelivaryListFrom(data: data)
            UserDefaults.standard.setValue(data, forKeyPath: GlobalText.CACHED_DATA_KEY)
            self.loadDataToTableView(deliveryArra: resultArray)
        }
        catch let error {
            show(message: error.localizedDescription)
        }
    }
    
}

// layout the views
extension DeliveryListViewController {
    
    func setupLayout(){
        constrain(tableView,topView,self.view){ tableView , topView,view in
            tableView.top ==  topView.bottom + 10
            tableView.left == topView.left + 20
            tableView.right == topView.right - 20
            tableView.bottom == view.bottom
        }
    }
}


