//
//  RequestVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/17/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class RequestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableUI()
    }
    
    
    
    // MARK:- Request List
    let list = UI()
    func tableUI(){
        list.TableView(x: 0, y: 70, width: x, height: y-70, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), border: 0, borderColor: .clear, separatorColor: .clear, Sections: 1, SectionHeight: 0, SectionHEIGHT: {
        }, sectionView: {
        }, rows: 4, Rows: {
        }, editing: false, cellheight: 100, CellHeight: {
        }, Cellview: {
            self.cellview()
        }, onDelete: {
        }, view: view)
    }
    
    func cellview(){
        let cell = list.tableDelegate.cell
        
        let cellview = nibView(fileName: "requestcellNib", ownerClass: self) as! requestcellV
        cellview.frame = CGRect(x: 0, y: 0, width: x, height: cell.frame.size.height)
        cell.addSubview(cellview)
        
        cellview.Input(Notification: "my notification", status: "Pending")
    }
    
    
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    
    
    

}
