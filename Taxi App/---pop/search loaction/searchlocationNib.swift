//
//  searchlocationNib.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/19/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit
import GoogleMaps

class searchlocationNib: UIView {

    private var parent = UIViewController()
    private var mapview = GMSMapView()
    @IBOutlet weak var location: UITextField!
    
    
    
    @IBOutlet weak var label: sbLable!
    
    @IBOutlet weak var view: UIView!
    
    private var textfield = UITextField()
    
    
    
    func Input(any:UIViewController,map:GMSMapView,LabelA:String,textfield:UITextField){
        self.textfield = textfield
        self.label.text = LabelA
        self.parent = any
        self.mapview = map
        
        any.stopLoader()
        
        self.location.becomeFirstResponder()
        self.location.resignFirstResponder()
        self.location.addTarget(self, action: #selector(editchange), for: .editingChanged)
    }
    
    @objc func editchange(){
        self.textfield.text = location.text
        
        apiobj.googleplacesSearchAPI(any: parent, searchText: location.text!, googleAPIkey: googleApiKey) {
            self.tableUI()
        }
    }
    
    @IBAction func closepop(_ sender: Any) {
        pop.disAppear()
    }
    
    
    
    
    
    
    
    
    
    
    // table
    let list  = UI()
    func tableUI(){
        list.TableView(x: 0, y: 0, width: 200, height: 200, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), border: 0, borderColor: .clear, separatorColor: .clear, Sections: 1, SectionHeight: 0, SectionHEIGHT: {
        }, sectionView: {
        }, rows: googleplacesobj.count, Rows: {
        }, editing: false, cellheight: 50, CellHeight: {
        }, Cellview: {
            self.cellview()
        }, onDelete: {
        }, view: view)
        list.table.leading(view.leadingAnchor, constant: 0)
        list.table.top(view.topAnchor, constant: 0)
        list.table.trailing(view.trailingAnchor, constant: 0)
        list.table.bottom(view.bottomAnchor, constant: 0)
        list.table.reloadData()
    }
    
    func cellview(){
        let cell = list.tableDelegate.cell
        let index = list.tableDelegate.index
        let btn = UI()
        btn.LButton(x: 10, y: 0, width: cell.frame.size.width-20, height: cell.frame.size.height, title: googleplacesobj[index].address, fontSize: 12, any: self, tapfunction: #selector(addressbtn), cornerRadius: 0, bordercolor: UIColor.clear.cgColor, bkcolor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), txtcolor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), view: cell)
        btn.Lbutton.tag = index
    }
    
    @objc func addressbtn(_ tap:UITapGestureRecognizer){
        location.text = googleplacesobj[tap.view!.tag].address
        textfield.text = googleplacesobj[tap.view!.tag].address
        if label.text == "A" {
            rideRequestobj.pickupAddress = googleplacesobj[tap.view!.tag].address
            rideRequestobj.pickup_lati = googleplacesobj[tap.view!.tag].latitude
            rideRequestobj.pickup_longi = googleplacesobj[tap.view!.tag].longitude
            
            mapview.createMarker(marker: rideRequestobj.pickupMarker,
                                 titleMarker: googleplacesobj[tap.view!.tag].name,
                                 iconMarker: UIImage(named: "A")!,
                                 latitude: rideRequestobj.pickup_lati,
                                 longitude: rideRequestobj.pickup_longi)
        }
        else{
            rideRequestobj.dropAddress = googleplacesobj[tap.view!.tag].address
            rideRequestobj.drop_lati = googleplacesobj[tap.view!.tag].latitude
            rideRequestobj.drop_longi = googleplacesobj[tap.view!.tag].longitude
            
            mapview.createMarker(marker: rideRequestobj.dropMarker,
                                 titleMarker: googleplacesobj[tap.view!.tag].name,
                                 iconMarker: UIImage(named: "B")!,
                                 latitude: rideRequestobj.drop_lati,
                                 longitude: rideRequestobj.drop_longi)

        }
        if rideRequestobj.pickup_lati != 0.0 && rideRequestobj.pickup_longi != 0.0 && rideRequestobj.drop_lati != 0.0 && rideRequestobj.drop_longi != 0.0 {
            mapview.drawPath(

                startLocation_lati_longi: CGPoint(x: rideRequestobj.pickup_lati,
                                                  y: rideRequestobj.pickup_longi),
                endLocation_lati_longi: CGPoint(x: rideRequestobj.drop_lati,
                                                y: rideRequestobj.drop_longi),
                googleAPIkey: googleApiKey)
        }
        
        pop.disAppear()
    }
    
    
    @IBAction func showmap(_ sender: Any) {
        if label.text == "A" {
            isSatartingLocation = true
        }else{
            isSatartingLocation = false
        }
        pop.disAppear()
        parent.present(storyboardView(boardName: "main", pageID: "showmapVC"), animated: false)
        
    }
    
    
}
