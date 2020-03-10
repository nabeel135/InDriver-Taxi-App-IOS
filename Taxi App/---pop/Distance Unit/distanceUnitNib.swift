//
//  distanceUnitNib.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/18/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class distanceUnitNib: UIView {

    
    @IBOutlet weak var Kilometers: UIButton!
    @IBOutlet weak var Miles: UIButton!
    
    
    
    @IBAction func kilo(_ sender: Any) {
        Kilometers.isSelected = true
        Miles.isSelected = false
    }
    
    @IBAction func mile(_ sender: Any) {
        Kilometers.isSelected = false
        Miles.isSelected = true
    }
    
    @IBAction func cancel(_ sender: Any) {
        pop.disAppear()
    }
    
    
}
