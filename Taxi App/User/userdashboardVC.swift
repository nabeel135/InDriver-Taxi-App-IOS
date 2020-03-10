//
//  userdashboardVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/25/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import Alamofire
import SwiftyJSON


class userdashboardVC: UIViewController {
    
    
    
    
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var mapview: GMSMapView!
    let locationManger = CLLocationManager()

    @IBOutlet var requestview: UIView!
    @IBOutlet var requestedView: UIView!
    
    @IBOutlet weak var requestedStartingLocation: UILabel!
    @IBOutlet weak var requestedEndLocation: UILabel!
    @IBOutlet weak var requestedprice: UILabel!
    
    
    @IBOutlet var show: UIView!
    
    
    @IBOutlet weak var raiselabel: UILabel!
    
    @IBOutlet weak var startlocation: UITextField!
    @IBOutlet weak var endlocation: UITextField!
    @IBOutlet weak var cash: UITextField!
    @IBOutlet weak var comment: UITextField!
    
    
    
    
    // MARK:- View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if rideRequestobj.pickup_lati != 0.0 && rideRequestobj.pickup_longi != 0.0 {
            mapview.createMarker(marker: rideRequestobj.pickupMarker,
                                 titleMarker: "Start Location",
                                 iconMarker: UIImage(named: "A")!,
                                 latitude: rideRequestobj.pickup_lati,
                                 longitude: rideRequestobj.pickup_longi)
        }
        
        if rideRequestobj.drop_lati != 0.0 && rideRequestobj.drop_longi != 0.0 {
            mapview.createMarker(marker: rideRequestobj.dropMarker,
                                 titleMarker: "End Location",
                                 iconMarker: UIImage(named: "B")!,
                                 latitude: rideRequestobj.drop_lati,
                                 longitude: rideRequestobj.drop_longi)
        }
        if rideRequestobj.pickup_lati != 0.0 && rideRequestobj.pickup_longi != 0.0 && rideRequestobj.drop_lati != 0.0 && rideRequestobj.drop_longi != 0.0 {
            mapview.drawPath(

                startLocation_lati_longi: CGPoint(x: rideRequestobj.pickup_lati,
                                                  y: rideRequestobj.pickup_longi),
                endLocation_lati_longi: CGPoint(x: rideRequestobj.drop_lati,
                                                y: rideRequestobj.drop_longi),
                googleAPIkey: googleApiKey)
        }
    }
    
    
    // MARK:- View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show.frame = CGRect(x: (x/2)-20, y: y-40, width: 40, height: 40)
        view.addSubview(show)
        
        // request view
        requestview.isHidden = false
        requestview.frame = CGRect(x: 10, y: y-300, width: x-20, height: 300)
        view.addSubview(requestview)
        
        
        // requested view
        requestedView.isHidden = true
        requestedView.frame = CGRect(x: 10, y: y, width: x-20, height: 300)
        view.addSubview(requestedView)
        
        
        startlocation.addTarget(self, action: #selector(startlocationEditingbegin(_:)), for: .editingDidBegin)
        endlocation.addTarget(self, action: #selector(endlocationEditingbegin(_:)), for: .editingDidBegin)
        cash.addTarget(self, action: #selector(cashEditingbegin(_:)), for: .editingDidBegin)
        comment.addTarget(self, action: #selector(commentEditingbegin(_:)), for: .editingDidBegin)

        
        
        //google map
        locationManger.delegate = self
        mapview.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        locationManger.startMonitoringSignificantLocationChanges()
        
        
        
    }
    
    @objc func startlocationEditingbegin(_ textfield:UITextField){
        self.startLoader()
        pop.AppearSearchLocation(any: self, mapview: mapview,
                                 AorB: "A",
                                 Textfield: self.startlocation)
    }
    @objc func endlocationEditingbegin(_ textfield:UITextField){
        self.startLoader()
        pop.AppearSearchLocation(any: self, mapview: mapview,
                                 AorB: "B",
                                 Textfield: self.endlocation)
       }
    @objc func cashEditingbegin(_ textfield:UITextField){
        pop.AppearPkr(any: self, textfield: cash)
       }
    @objc func commentEditingbegin(_ textfield:UITextField){
        pop.AppearComment(any: self, textfield: comment)
       }
    
    
    func currentlocation(){
        do {
            let camera = GMSCameraPosition.camera(withLatitude: (self.locationManger.location?.coordinate.latitude)!, longitude: (self.locationManger.location?.coordinate.longitude)!, zoom: 14)
            
            //        let mapview = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: x, height: y-70), camera: camera)
            self.mapview.camera = camera
            self.mapview.settings.myLocationButton = true
            self.mapview.isMyLocationEnabled = true
            self.locationManger.stopUpdatingLocation()
        } catch is Error {
            print(Error.self)
        }
    }

    
    
    
    
    
    
    
    
    // MARK:- Buttons
    
    @IBAction func menuBtn(_ sender: UIButton) {
        sender.bouncybutton {
            menu.AppearUserMenu(any: self)
        }
    }
    
    
    @IBAction func sharebtn(_ sender: Any) {
        shareOnSocialMedia(Content: ["share taxi app"], ONsuccess: {
            self.showAlert(Title: "Message", Message: "Shared Successfully!")
        }) {
            self.showAlert(Title: "Message", Message: "not shared")
        }
    }
    
    @IBAction func requestviewDown(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 8, options: [], animations: {
            self.requestview.frame.origin.y = y
        }) { _ in
        }
    }
    
    @IBAction func requestedviewDown(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 8, options: [], animations: {
                   self.requestedView.frame.origin.y = y
               }) { _ in
               }
    }
    
    
    
    @IBAction func showrequestview(_ sender: Any) {
        if !requestview.isHidden {
            self.requestview.frame.origin.y = y
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 8, options: [], animations: {
                self.requestview.frame.origin.y = y-self.requestview.frame.size.height
            }) { _ in
            }
        }
        else{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 8, options: [], animations: {
                self.requestedView.frame.origin.y = y-self.requestedView.frame.size.height
            }) { _ in
            }
        }
    }
    
    
    
    @IBAction func raiseFareButton(_ sender: Any) {
        apiobj.RideRequestAPI(any: self,
                              userId: getString(key: useridkey),
                              pickupAddress: rideRequestobj.pickupAddress,
                              dropAddress: rideRequestobj.dropAddress,
                              pickupLati: rideRequestobj.pickup_lati.tostring(),
                              pickupLongi: rideRequestobj.pickup_longi.tostring(),
                              dropLati: rideRequestobj.drop_lati.tostring(),
                              dropLongi: rideRequestobj.drop_longi.tostring(),
                              fareOffer: rideRequestobj.fare_offer)
    }
    @IBAction func raiseplus5(_ sender: Any) {
        requestedprice.text = "\((raiselabel.text?.toInt())!+5)"
        raiselabel.text = "\((raiselabel.text?.toInt())!+5)"
        rideRequestobj.pkr = raiselabel.text!
    }
    
    @IBAction func raisesubtract5(_ sender: Any) {
        requestedprice.text = "\((raiselabel.text?.toInt())!-5)"
        raiselabel.text = "\((raiselabel.text?.toInt())!-5)"
        rideRequestobj.pkr = raiselabel.text!


    }
    
    
    @IBAction func requestBUTTON(_ sender: Any) {
        
        if validation() {
            self.requestedStartingLocation.text = rideRequestobj.pickupAddress
            self.requestedEndLocation.text = rideRequestobj.dropAddress
            self.requestedprice.text = rideRequestobj.pkr
            self.raiselabel.text = rideRequestobj.pkr
            self.requestview.isHidden = true
            self.requestedView.isHidden = false
            self.showrequestview("")
            apiobj.RideRequestAPI(any: self,
                                  userId: getString(key: useridkey),
                                  pickupAddress: rideRequestobj.pickupAddress,
                                  dropAddress: rideRequestobj.dropAddress,
                                  pickupLati: rideRequestobj.pickup_lati.tostring(),
                                  pickupLongi: rideRequestobj.pickup_longi.tostring(),
                                  dropLati: rideRequestobj.drop_lati.tostring(),
                                  dropLongi: rideRequestobj.drop_longi.tostring(),
                                  fareOffer: rideRequestobj.fare_offer)
        }
        
        
    }
    
    func validation()->Bool{
        if startlocation.text!.isEmpty || endlocation.text!.isEmpty || cash.text!.isEmpty || rideRequestobj.pickup_lati == 0.0 || rideRequestobj.pickup_longi == 0.0 || rideRequestobj.drop_lati == 0.0 || rideRequestobj.drop_longi == 0.0 {
            self.showAlert(Title: "Message", Message: "Textfield should't be empty!")
            return false
        }else{return true}
    }
    
    @IBAction func cancelRequestBTN(_ sender: UIButton) {
        sender.bouncybutton {
//            apiobj.cancelRideRequest(any: self,
//                                     rideID: <#T##String#>)
        }
    }
    
    
}












extension userdashboardVC:CLLocationManagerDelegate {
    
    // did update location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentlocation()
        
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        print("press l")
    }
}

extension userdashboardVC: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        mapView.isMyLocationEnabled = true
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        mapView.isMyLocationEnabled = true
    }
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        mapView.isMyLocationEnabled = true
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
    }
    
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        mapView.isMyLocationEnabled = true
        mapView.selectedMarker = nil
        return false
    }
    
    
        
}




// my function
extension GMSMapView {
    // MARK: function for create a marker pin on map
    func createMarker(marker:GMSMarker ,titleMarker: String,iconMarker:UIImage, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//        marker.map?.clear()
         let location = CLLocationCoordinate2DMake(latitude, longitude)
        
        marker.position = location
        marker.title = titleMarker
//        marker.snippet = "Current Location"
        marker.appearAnimation = GMSMarkerAnimation.pop
        marker.icon = iconMarker
        marker.map = self
        self.camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitude, zoom: 14)
        
    }
    
    
    
    
    
    func drawPath(startLocation_lati_longi: CGPoint, endLocation_lati_longi: CGPoint,googleAPIkey:String)
    {
        let origin = "\(startLocation_lati_longi.x),\(startLocation_lati_longi.y)"
        let destination = "\(endLocation_lati_longi.x),\(endLocation_lati_longi.y)"
        
        print("origin: \(origin)")
        print("destination \(destination)")
        print("-------------------------------")
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving&key=\(googleAPIkey)"
        
        Alamofire.request(url).responseJSON { response in
            
            switch response.result {
            case .success(_):
//                print(response.request as Any)  // original URL request
//                print(response.response as Any) // HTTP URL response
//                print(response.data as Any)     // server data
//                print(response.result as Any)   // result of response serialization
                
                let json = JSON(response.data!)
                
                let routes = json["routes"].arrayValue
                
                // print route using Polyline
                for route in routes
                {
                    let routeOverviewPolyline = route["overview_polyline"].dictionary
                    let points = routeOverviewPolyline?["points"]?.stringValue
                    let path = GMSPath.init(fromEncodedPath: points!)
//                    self.clear()
                    rideRequestobj.polyline.map = nil
                    
                    
                    rideRequestobj.polyline = GMSPolyline.init(path: path)
                    
                    rideRequestobj.polyline.strokeWidth = 4
                    rideRequestobj.polyline.strokeColor = UIColor.red
                    rideRequestobj.polyline.map = self
                }
            case .failure(let err):
                print("drawpath: \(err.localizedDescription)")
                break
            }
            
        }
    }
    
    
}










