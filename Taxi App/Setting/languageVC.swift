//
//  languageVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/26/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class languageVC: UIViewController {

    
    //MARK:- IBOutlets
    
    @IBOutlet weak var defaultlanguage: UIButton!
    
    
    
    
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    
    //MARK:- Buttons

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    
    
    @IBAction func defaultLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.English, for: .normal)
    }
    
    @IBAction func englishlang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.English, for: .normal)

    }
    
    @IBAction func russianLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.Russian, for: .normal)

    }
    
    @IBAction func spanish(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.Spanish, for: .normal)

    }
    
    @IBAction func portugalLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.Portuguese, for: .normal)

    }
    
    @IBAction func frenchLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.French, for: .normal)

    }
    
    @IBAction func hindiLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.Hindi, for: .normal)

    }
    
    @IBAction func indonesianLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.Indonesian, for: .normal)

    }
    
    @IBAction func filipinoLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.Filipino, for: .normal)

    }
    
    @IBAction func arabicLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.Arabic, for: .normal)

    }
    
    @IBAction func ThaiLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.Thai, for: .normal)

    }
    
    @IBAction func VietnameseLang(_ sender: UIButton) {
        self.defaultlanguage.setTitle(LanguageName.Vietnamese, for: .normal)

    }
    
    
    
    
}
