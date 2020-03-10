//
//  menuNib.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/17/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class menuNib: UIView {
    
    @IBOutlet weak var profilepic: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var city: UIView!
    @IBOutlet weak var requesthistory: UIView!
    @IBOutlet weak var setting: UIView!
    @IBOutlet weak var support: UIView!
    @IBOutlet weak var help: UIView!
    
    
    var parent = UIViewController()
    
    func Input(any:UIViewController,imageURL:String,userName:String){
        self.parent = any
        self.profilepic.loadimage(url: URL(string: imageURL)!)
        self.username.text = userName
        
        city.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(citybtn)))
        requesthistory.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(requestHistorybtn(_:))))
        
        setting.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(settingbtn(_:))))
        
        support.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(supportbtn(_:))))
        
        help.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(helpbtn(_:))))
        
        
    }
    
    @IBAction func profilebtn(_ sender: UIButton) {
        menu.disAppear()
        parent.present(storyboardView(boardName: "main", pageID: "updateProfileVC"), animated: false)
        
    }
    
    @objc func citybtn(_ tap:UITapGestureRecognizer){
        menu.disAppear()
    }
    
    @objc private func requestHistorybtn(_ tap:UITapGestureRecognizer){
        menu.disAppear()
        self.parent.present(storyboardView(boardName: "main", pageID: "RequestVC"), animated: false)
        
    }
    
    
    @objc private func settingbtn(_ tap:UITapGestureRecognizer){
        menu.disAppear()
        self.parent.present(storyboardView(boardName: "main", pageID: "settingVC"), animated: false)
        
    }
    
    @objc private func supportbtn(_ tap:UITapGestureRecognizer){
        menu.disAppear()
        self.parent.present(storyboardView(boardName: "main", pageID: "supportVC"), animated: false)
        
        
    }
    
    @objc private func helpbtn(_ tap:UITapGestureRecognizer){
        menu.disAppear()
        //            self.parent.present(storyboardView(boardName: "main", pageID: <#T##String#>), animated: false)
        
    }
    
        
}
