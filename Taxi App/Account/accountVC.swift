//
//  accountVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/17/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class accountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        self.view.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
        print(self.view.layer.maskedCorners)
        
    }
    
    @IBAction func login(_ sender: Any) {
        self.present(storyboardView(boardName: "main", pageID: "loginVC"), animated: false)
    }
    
    
    
    @IBAction func signup(_ sender: Any) {
        self.present(storyboardView(boardName: "main", pageID: "signupVC"), animated: false)

    }
    
    
}
