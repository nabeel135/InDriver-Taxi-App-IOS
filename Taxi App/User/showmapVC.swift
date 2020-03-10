//
//  showmapVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/26/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit
import GoogleMaps

class showmapVC: UIViewController {

    @IBOutlet var upperview: UIView!
    @IBOutlet weak var mapview: GMSMapView!
    @IBOutlet var nextview: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    
    
    let locationManger = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        upperview.frame = CGRect(x: 0, y: 70, width: x, height: 70)
        nextview.frame = CGRect(x: 0, y: y-70, width: x, height: 40)
        view.addSubview(upperview)
        view.addSubview(nextview)
        
        if isSatartingLocation {
            label.text = "Specify a place to pick you up"

        }else{
            label.text = "Specify a place to Take you to"
        }
        
        
        // Google Map
        mapview.delegate = self
        locationManger.delegate = self
        
        
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func mylocation(_ sender: Any) {
        self.currentlocation()
    }
    
    @IBAction func next(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    
}










extension showmapVC: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentlocation()
    }
    
    
     func currentlocation(){
         do {
             let camera = GMSCameraPosition.camera(withLatitude: (self.locationManger.location?.coordinate.latitude)!, longitude: (self.locationManger.location?.coordinate.longitude)!, zoom: 14)
             
            
             //        let mapview = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: x, height: y-70), camera: camera)
             self.mapview.camera = camera
             self.mapview.settings.myLocationButton = true
             self.mapview.isMyLocationEnabled = true
            
            if isSatartingLocation {
                rideRequestobj.pickup_lati = (self.locationManger.location?.coordinate.latitude)!
                rideRequestobj.pickup_longi = (self.locationManger.location?.coordinate.longitude)!
                mapview.createMarker(marker: rideRequestobj.pickupMarker,
                                     titleMarker: "Start Location",
                                     iconMarker: UIImage(named: "A")!,
                                     latitude: rideRequestobj.pickup_lati,
                                     longitude: rideRequestobj.pickup_longi)
            }else{
                rideRequestobj.drop_lati = (self.locationManger.location?.coordinate.latitude)!
                rideRequestobj.drop_longi = (self.locationManger.location?.coordinate.longitude)!
                mapview.createMarker(marker: rideRequestobj.pickupMarker,
                                     titleMarker: "End Location",
                                     iconMarker: UIImage(named: "B")!,
                                     latitude: rideRequestobj.drop_lati,
                                     longitude: rideRequestobj.drop_longi)
            }
            self.locationManger.stopUpdatingLocation()

         } catch is Error {
             print(Error.self)
         }
     }
}








extension showmapVC: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        if isSatartingLocation {
            rideRequestobj.pickup_lati = coordinate.latitude
            rideRequestobj.pickup_longi = coordinate.longitude
            mapview.createMarker(marker: rideRequestobj.pickupMarker, titleMarker: "Start Location", iconMarker: UIImage(named: "A")!, latitude: coordinate.latitude, longitude: coordinate.longitude)
        }else{
            rideRequestobj.drop_lati = coordinate.latitude
            rideRequestobj.drop_longi = coordinate.longitude
            mapview.createMarker(marker: rideRequestobj.pickupMarker, titleMarker: "End Location", iconMarker: UIImage(named: "B")!, latitude: coordinate.latitude, longitude: coordinate.longitude)
        }
        
    }
}
