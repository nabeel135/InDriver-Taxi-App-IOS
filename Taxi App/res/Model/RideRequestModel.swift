//
//  RideRequestModel.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/26/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import GoogleMaps



var isSatartingLocation = false


let rideRequestobj = RR()
class RR {
    var id = String()
    var pickupMarker = GMSMarker()
    var pickupAddress = String()
    var pickup_lati = Double()
    var pickup_longi = Double()
    var dropMarker = GMSMarker()
    var dropAddress = String()
    var drop_lati = Double()
    var drop_longi = Double()
    var fare_offer = String()
    var pkr = String()
    var comment = String()
    var morethan4passengers = false
    var childseat = false
    var polyline = GMSPolyline()
}
