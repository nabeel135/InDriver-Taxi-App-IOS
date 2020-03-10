//
//  API.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/18/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON




let apiobj = api()
class api{
    // MARK:- Login
    func loginApi(any:UIViewController,email:String,password:String,runAfter:@escaping()->Void){
        db.jsonResponse(url: "http://travces.com/taxi/public/api/login",
                        method: .post,
                        parameters: ["email":email,
                                     "password":password],
                        headers: ["Accept":"application/json"],
                        onStart: {
                            any.startLoader()
        },
                        onSuccess: {
                            any.stopLoader()
                            let user = db.json["data"]["user"]
                            if db.json["status"].stringValue == "200" {
                                save(value: true, key: islogin)
                                save(value: db.json["data"]["token"].stringValue, key: userkey)
                                profileDetailobj.imag = user["avatar"].stringValue
                                profileDetailobj.gender = user["sex"].stringValue
                                profileDetailobj.mobile = user["mobile"].stringValue
                                profileDetailobj.id = user["id"].stringValue
                                profileDetailobj.name = user["name"].stringValue
                                profileDetailobj.city = user["city"].stringValue
                                profileDetailobj.status = user["state"].stringValue
                                profileDetailobj.country = user["country"].stringValue
                                profileDetailobj.latitude = user["latitude"].stringValue
                                profileDetailobj.longitude = user["longitude"].stringValue
                                profileDetailobj.email = user["email"].stringValue
                                profileDetailobj.dateofbirth = user["dob"].stringValue
                                //user default
                                save(value: user["id"].stringValue, key: useridkey)
                                save(value: user["name"].stringValue, key: usernamekey)
                                save(value: user["mobile"].stringValue, key: userphonekey)
                                save(value: user["sex"].stringValue, key: usergenderkey)
                                save(value: user["email"].stringValue, key: useremailkey)
                                runAfter()
                            }
                            else{
                                any.showAlert(Title: "Message", Message: db.json["message"].stringValue)
                                save(value: "", key: userkey)
                            }



        }) {
            any.stopLoader()
            any.showAlert(Title: "Error", Message: db.err)
        }
    }
    
    
    
    
    // MARK:- Sign up
    func signupApi(any:UIViewController,name:String,email:String,mobile:String,password:String,utype:String,runAfter:@escaping()->Void){
        db.jsonResponse(url: "http://travces.com/taxi/public/api/register",
                        method: .post,
                        parameters: ["name":name,
                                     "email":email,
                                     "mobile":mobile,
                                     "password":password,
                                     "utype":utype],
                        headers: ["Accept":"application/json"],
                        onStart: {
                            any.startLoader()
        },
                        onSuccess: {
                            any.stopLoader()
                            if db.json["status"].stringValue == "200"{
                                save(value: db.json["status"].stringValue, key: userkey)
                                runAfter()
                            }
                            else{
                                any.showAlert(Title: "Message", Message: db.json["message"].stringValue)
                                save(value: "", key: userkey)
                            }
        },
                        onFailure: {
                            any.stopLoader()
                            any.showAlert(Title: "Error", Message: db.err)
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- Update Profile
//    func updateProfileAPI(any:UIViewController,userId:String,name:String,email:String,dateOfBirth:String,gender:String,city:String,image:UIImage) {
//
//        print("\(userId) \n\(name) \n\(email) \n\(dateOfBirth) \n\(gender) \n\(city) \n\(image)")
//
//        db.jsonResponse(url: "http://travces.com/taxi/public/api/complete_profile",
//                        method: .post,
//                        parameters: ["user_id":userId,
//                                     "name":name,
//                                     "email":email,
//                                     "dob":dateOfBirth,
//                                     "sex":gender,
//                                     "city":city,
//                                     "avatar":image.jpegData(compressionQuality: 0.5)!],
//                        headers: ["Accept":"application/json"],
//                        onStart: {
//                            any.startLoader()
//        },
//                        onSuccess: {
//                            any.stopLoader()
//                            print("----------------------------------")
//                            print(db.json)
//        },
//                        onFailure: {
//                            any.stopLoader()
//                            any.showAlert(Title: "Error", Message: db.err)
//        })
//    }
    
    
    func updateProfileAPI(any:UIViewController,userId:String,name:String,email:String,dateOfBirth:String,gender:String,city:String,image:UIImage) {
        

        var parameters : [String:String] = [:]
        parameters["user_id"] = userId
        parameters["name"] = name
        parameters["email"] = email
        parameters["dob"] = dateOfBirth
        parameters["sex"] = gender
        parameters["city"] = city

        let url = "http://travces.com/taxi/public/api/complete_profile"
        
        any.startLoader()
        Alamofire.upload(multipartFormData: { (data) in
            for (key, value) in parameters
            {data.append(value.data(using: String.Encoding.utf8)!, withName: key)}
            
            data.append(image.pngData()!, withName: "avatar", fileName: "image.png", mimeType: "image/png")
        },
                         usingThreshold: UInt64.init(),
                         to: url,
                         method: .post,
                         headers: ["Accept":"application/json"])
        { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { data in
                    any.stopLoader()
                    let d = data.result.value as! NSDictionary
                    any.showAlert(Title: "Message", Message: d["message"] as! String)
                }
            case .failure(let err):
                any.stopLoader()
                print("error: \(err.localizedDescription)")
            }
        }
    }
    
    
    
    
    
    
    
    // MARK:- New Ride Request
    func RideRequestAPI(any:UIViewController,userId:String,pickupAddress:String,dropAddress:String,pickupLati:String,pickupLongi:String,dropLati:String,dropLongi:String,fareOffer:String) {
        db.jsonResponse(url: "http://travces.com/taxi/public/api/ride_request",
                        method: .post,
                        parameters: ["user_id":userId,
                                     "pickup_address":pickupAddress,
                                     "drop_address":dropAddress,
                                     "pickup_lati":pickupLati,
                                     "pickup_longi":pickupLongi,
                                     "drop_lati":dropLati,
                                     "drop_longi":dropLongi,
                                     "fare_offer":fareOffer],
                        headers: ["Accept":"application/json"],
                        onStart: {
                            any.startLoader()
        },
                        onSuccess: {
                            any.stopLoader()
                            print(db.json)
                            any.showAlert(Title: "Message", Message: db.json["message"].stringValue)
        },
                        onFailure: {
                            any.stopLoader()
                            any.showAlert(Title: "Error", Message: db.err)
        })
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK:- Cancel Ride Request
    func cancelRideRequest(any:UIViewController,rideID:String){
        db.jsonResponse(url: "http://travces.com/taxi/public/api//cancel_ride_request",
                        method: .post,
                        parameters: ["_method":"PUT",
                                     "ride_id":rideID],
                        headers: ["Accept":"application/json"],
                        onStart: {
                            any.startLoader()
        },
                        onSuccess: {
                            any.stopLoader()
                            print(db.json)
        },
                        onFailure: {
                            any.stopLoader()
                            any.showAlert(Title: "Error", Message: db.err)
        })
    }
    
    
    
    
    
    
    
    //MARK:- Customer Ride History
    func customerRideHistory(any:UIViewController,userId:String){
        db.jsonResponse(url: "http://travces.com/taxi/public/api/customer_ride_history",
                        method: .post,
                        parameters: ["user_id":userId],
                        headers: ["Accept":"application/json"],
                        onStart: {
                            any.startLoader()
        },
                        onSuccess: {
                            any.stopLoader()
                            print(db.json)
        },
                        onFailure: {
                            any.stopLoader()
                            any.showAlert(Title: "Error", Message: db.err)
        })
    }
    
    
    
    
    
    
    //MARK:- Google Places
    func googleplacesSearchAPI(any:UIViewController,searchText:String,googleAPIkey:String,runAfter:@escaping()->Void){
        let search = searchText.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        db.jsonResponse(url: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(search)&key=\(googleAPIkey)",
                        method: .get,
                        parameters: [:],
                        headers: [:],
                        onStart: {
                            any.startLoader()
        },
                        onSuccess: {
                            any.stopLoader()
                            googleplacesobj.removeAll()
                            for obj in db.json["results"].arrayValue {
                                let o = GP()
                                o.id = googleplacesobj.count.tostring()
                                o.name = obj["name"].stringValue
                                o.address = obj["formatted_address"].stringValue
                                o.longitude = obj["geometry"]["location"]["lng"].doubleValue
                                o.latitude = obj["geometry"]["location"]["lat"].doubleValue
                                googleplacesobj.append(o)
                            }
                            runAfter()
        },
                        onFailure: {
                            any.stopLoader()
//                            any.showAlert(Title: "Error", Message: db.err)
        })
    }
    
    
}
