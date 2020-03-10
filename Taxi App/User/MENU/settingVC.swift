//
//  settingVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/25/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class settingVC: UIViewController {

    
    // MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK:- Buttons
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func logout(_ sender: Any) {
        save(value: false, key: islogin)
        self.present(storyboardView(boardName: "main", pageID: "accountVC"), animated: false)
        
    }
    
}
