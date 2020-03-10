//
//  SceneDelegate.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/17/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
        
        
        if getBool(key: islogin) {
            self.root(scene, storyboardView(boardName: "main", pageID: "userdashboardVC"))

        }else{
            self.root(scene, storyboardView(boardName: "main", pageID: "accountVC"))
        }
        
//        self.root(scene, storyboardView(boardName: "driver", pageID: "vehiclephotoVC"))

        
    }



}



