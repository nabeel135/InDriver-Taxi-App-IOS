//
//  vehiclephotoVC.swift
//  Taxi App
//
//  Created by Nabeel on 04/03/2020.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class vehiclephotoVC: UIViewController {

    // MARK:- IBoutlets
    
    @IBOutlet weak var carphoto: sbImageView!
    @IBOutlet weak var certificatephoto: sbImageView!
    
    
    // MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func editBUTTON(_ sender: UIButton) {
    }
    
    
    
    @IBAction func addCarPhotoBUTTON(_ sender: UIButton) {
        sender.bouncybutton {
            let picker = UI()
            picker.takePhoto(any: self, Title: "Vehicle Photo", Description: "Take a photo of your vehicle so that license plate number is shown", imagview: self.carphoto!, contentMode: .scaleAspectFit)
        }
    }
    
    
    
    
    @IBAction func addCertificateBUTTON(_ sender: UIButton) {
        sender.bouncybutton {
            let picker = UI()
            picker.takePhoto(any: self, Title: "Certificate Photo", Description: "Certificate of vehicle registration", imagview: self.certificatephoto!, contentMode: .scaleAspectFit)
        }
    }
    

    

}
