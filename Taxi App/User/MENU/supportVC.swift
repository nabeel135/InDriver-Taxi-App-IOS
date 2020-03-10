//
//  supportVC.swift
//  Taxi App
//
//  Created by Mr. Nabeel on 2/20/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import UIKit

class supportVC: UIViewController {
    
    
    // MARK:- IBOutlets
    @IBOutlet weak var message: sbTextView!
    
    @IBOutlet weak var downarrow: UIButton!
    
    
    // MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        tableUI()
        tableview.bringSubviewToFront(downarrow)

    }
    
    
    let chatroomDelegate = chatroom()
    let tableview = UITableView()
    func tableUI(){
        tableview.register(chatroom.self, forCellReuseIdentifier: "cell")
        tableview.backgroundColor = #colorLiteral(red: 0.9868122935, green: 0.9581133723, blue: 0.9543444514, alpha: 1)
        tableview.frame = CGRect(x: 0, y: 70, width: x, height: y-120)
        tableview.dataSource = chatroomDelegate
        tableview.separatorStyle = .none
        tableview.allowsSelection = false
        view.addSubview(tableview)
    }
    
    
    // MARK:- Buttons
    
    @IBAction func sendMessage(_ sender: UIButton) {
        sender.bouncybutton {
            print(self.message.text!)
            mg.append(self.message.text!)
            self.tableview.reloadData()
            self.tableview.scrollToRow(at: .init(item: mg.count-1, section: 0), at: .bottom, animated: true)
            self.message.text = ""
        }
    }
    
    @IBAction func moveDown(_ sender: Any) {
        self.tableview.scrollToRow(at: .init(item: mg.count-1, section: 0), at: .bottom, animated: true)

    }
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    
    
    
    
    
}







class chatroom:UITableViewCell, UITableViewDataSource {
    
    let body = UIView()
    let textbk = UIView()
    let message = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        body.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 0.05)
        addSubview(body)
        let sender = true
        if sender{textbk.backgroundColor = #colorLiteral(red: 0.6875652671, green: 0.1534278691, blue: 0.1378995478, alpha: 1)}
        else{textbk.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)}
        textbk.layer.cornerRadius = 15
        addSubview(textbk)
        
        message.numberOfLines = 0
        if sender{message.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)}
        else{message.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)}
        message.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        addSubview(message)
     
        
        
        // set constraints
        if sender {message.trailing(trailingAnchor, constant: -30)}
        else{message.leading(leadingAnchor, constant: 30)}
        message.top(topAnchor, constant: 20)
        message.bottom(bottomAnchor, constant: -20)
        message.width_lessThanorEqualTo(constant: (x/100)*70)
        
        textbk.leading(message.leadingAnchor, constant: -10)
        textbk.trailing(message.trailingAnchor, constant: 10)
        textbk.top(message.topAnchor, constant: -10)
        textbk.bottom(message.bottomAnchor, constant: 10)
        
        body.left(leftAnchor, constant: 0)
        body.right(rightAnchor, constant: 0)
        body.top(topAnchor, constant: 0)
        body.bottom(bottomAnchor, constant: 0)
                
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // table view datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! chatroom
        let index = indexPath.row
        
        cell.message.text = mg[index]
        return cell
    }
}























var mg = ["one lsi elaksdjfoeiru","lskjoei uasldfjoewiur asldkfja eowirua dslkfjaweoiru sdkfjsldkfj weoeiruae fsldkfjsleiru aowrteiusldf eiu","sldkfj weoeiruae fsldkfjsleiru aowrteiusldsldkfj weoeiruae fsldkfjsleiru aowrteiusldsldkfj weoeiruae fsldkfjsleiru aowrteiusldsldkfj weoeiruae fsldkfjsleiru aowrteiusldsldkfj weoeiruae fsldkfjsleiru aowrteiusldsldkfj weoeiruae fsldkfjsleiru aowrteiusldsldkfj weoeiruae fsldkfjsleiru aowrteiusldsldkfj weoeiruae fsldkfjsleiru aowrteiusld","one lsi elaksdjfoeiru"]





 
