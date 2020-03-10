//
//  loginVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/18/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    
    
    // MARK:- IBoutlets
    
    @IBOutlet weak var email: sbTextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    
    
    
    
    
    // MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    
    // MARK:- Buttons
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    @IBAction func loginbtn(_ sender: Any) {
        if validation() {
            apiobj.loginApi(any: self,
            email: email.text!,
            password: password.text!){
                self.present(storyboardView(boardName: "main", pageID: "userdashboardVC"), animated: false)
            }
        }
    }
    
    @IBAction func forgotpasspage(_ sender: Any) {
        self.present(storyboardView(boardName: "main", pageID: "forgotpassVC"), animated: false)
    }
    
    @IBAction func signupPage(_ sender: Any) {
        self.present(storyboardView(boardName: "main", pageID: "signupVC"), animated: false)

    }
    
    
    
    func validation()->Bool{
        if email.text!.isEmpty || password.text!.isEmpty {
            self.showAlert(Title: "Message", Message: "Textfield Should not be empty!")
            return false
        }else{return true}
    }
    
    
    
}
