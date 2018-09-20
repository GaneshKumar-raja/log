//
//  SelectedItemDetailsController.swift
//  LogisticDemo
//
//  Created by Ganesh on 17/09/18.
//  Copyright © 2018 ganeshkumar. All rights reserved.
//

import UIKit
import GoogleMaps
import Cartography

class SelectedItemDetailsController: BaseViewController {
    var mapView : GMSMapView!
    var decriptionLable : Label!
    var addressLable : Label!
    var userImage : UIImageView!
    var deliveryDetails : DeliveryModelElement!
    
    init(deliveryDetails:DeliveryModelElement) {
        super.init(nibName: nil, bundle: nil)
        self.initTopViews()
        self.deliveryDetails = deliveryDetails
        initAllViews()
        addAllViews()
        setupLayout()
        setThemeToViews()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
         topView.set(title: GlobalText.DEATILS_SCREEN_TITLE)
         self.view.backgroundColor = UIColor.white
        self.topView.backButton(isHidden : false)
       
    }
    
    override
    func viewDidAppear(_ animated: Bool) {
        setDeliveryDetailsToViews()
        loadMarkerOnMain()
        moveMapToLocation()
    }
    
   // func viewdi

    func initAllViews(){
        userImage = UIImageView()
        decriptionLable = Label()
        addressLable = Label()
        mapView = GMSMapView()
    }
    
    func addAllViews(){
         self.view.addSubview(userImage)
         self.view.addSubview(decriptionLable)
         self.view.addSubview(addressLable)
         self.view.addSubview(mapView)
    }

    
    func setThemeToViews(){
        decriptionLable.setText(style: .subTilte)
        addressLable.setText(style: .description)
    }
    
    func setDeliveryDetailsToViews(){
        let url = URL(string: deliveryDetails.imageURL)
        userImage.kf.setImage(with: url)
        decriptionLable.text = deliveryDetails.description
        addressLable.text = deliveryDetails.location.address
    }
    
}

extension SelectedItemDetailsController{
    func loadMarkerOnMain(){
        DispatchQueue.main.async {
             self.loadMarkerToMap()
        }
    }
    
    func moveMapToLocation(){
        let camera = GMSCameraPosition.camera(withLatitude: self.deliveryDetails.location.lat, longitude: self.deliveryDetails.location.lng, zoom: 16)
        self.mapView!.camera = camera
        self.mapView!.animate(to: camera)
    }
    
    func loadMarkerToMap(){
        let position = CLLocationCoordinate2DMake(self.deliveryDetails.location.lat,self.deliveryDetails.location.lng)
        let marker = GMSMarker(position: position)
        marker.title = self.deliveryDetails.location.address
        marker.map = self.mapView
    }
}

extension SelectedItemDetailsController{
    
    func setupLayout(){
        constrain(userImage,topView,self.view){userImage,topView ,view in
            userImage.top == topView.bottom + 20
            userImage.left == view.left + 20
            userImage.width == 60
            userImage.height == 60
        }
        
        constrain(decriptionLable,topView,userImage){decriptionLable,topView,userImage  in
            decriptionLable.top == topView.bottom + 20
            decriptionLable.left == userImage.right + 20
        }
        
        constrain(addressLable,decriptionLable,userImage){addressLable,decriptionLable,userImage  in
            addressLable.top == decriptionLable.top + 20
            addressLable.left == userImage.right + 20
        }
        
        constrain(mapView,userImage,self.view){ mapView ,userImage,view  in
            mapView.top == userImage.bottom + 20
            mapView.bottom == view.bottom - 20
            mapView.left == view.left + 20
            mapView.right == view.right - 20
            
        }
    }
}
