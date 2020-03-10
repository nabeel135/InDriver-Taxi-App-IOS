// Feature.swift dependent

import Foundation
import UIKit
import AVFoundation
import MBProgressHUD
import FlagPhoneNumber



let x = UIScreen.main.bounds.size.width
let y = UIScreen.main.bounds.size.height
class UI: UIView {
    let imagpicker = UIImagePickerController()
    let imagpickerDelegate = IPC()
    let table = UITableView()
    let tableDelegate = TVC()
    let collectionDelegate = CVC()
    var collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let label = UILabel.init()
    let imag = UIImageView()
    let clickableimg = UIButton.init()
    let button = UIButton.init(type: UIButton.ButtonType.roundedRect)
    let view = UIView.init()
    let txtfield = UITextField.init()
    let txtview = UITextView.init()
    let msgbox = UIView.init()
    let scrollview = UIScrollView.init()
    let Lbutton = UIView.init()
    let Lbuttontext = UILabel.init()
    let clickAbleViewImage = UIView.init()
    let input = UIView.init()
    let comboBox = UIView()
    var comboBoxrunAfter:() -> () = {}
    private var iscomboBoxcreated = false
    let autoSizelabel = UILabel()
    let toastmsg = UILabel()

    let triangle = CAShapeLayer()
    let line = CAShapeLayer()
    let arc = CAShapeLayer()
    let cgpath = UIBezierPath()
    let checkBox = UIButton.init()
    var isCheckBoxChecked = false
    private var checkBoxfunc:() -> () = {}
    var checkBoxtrueimage = UIImage()
    var checkboxfalseimage = UIImage()
    
    let datePicker = UIDatePicker()
    var selectedDate: String = ""
    private var datePickerFormat = "yyyy-MM-dd"
    private var timePickerFormat = "HH:mm"
    private var datepick = false
    let pageController = UIPageControl()
    

    
    
    /*-------------------------------------------------*/
    // Slider
    private var sliderSize = Int()
    private var slidertimer = Timer()
    private var sliderCounter:Int = 0
    func Slider(frame:CGRect,autoScroll:Bool,isPager:Bool,scrollintervel:TimeInterval,images:[UIImage],view:UIView){
        sliderSize = images.count
        CollectionView(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height, bkcolor: .clear, scrolldirection: .horizontal, isPaging: true, InterSpaceHorizontal: 0, InterSpaceVertical: 0, numberOFcells: 3, cellsize: {
            self.collectionDelegate.cellSize = CGSize(width: x, height: 300)
        }, cellmargin: {
            self.collectionDelegate.cellMargin = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }, cellview: {
            /*-----------------*/
            let cell = self.collectionDelegate.cell
            let index = self.collectionDelegate.index
            cell.BackgroundImage(image: images[index])
            /*-----------------*/
        }, view: view)
        
        
        
        if isPager {
            PageConroller(x: frame.origin.x, y: frame.origin.y+frame.height-40, width: x, height: 40, pageCount: images.count, view: view)
        }
        if autoScroll {
            DispatchQueue.main.async {
                self.slidertimer = Timer.scheduledTimer(timeInterval: scrollintervel, target: self, selector: #selector(self.sliderChang), userInfo: nil, repeats: true)
            }
        }
        
        
    }
    
    @objc func sliderChang(){
        if sliderCounter < sliderSize {
            collection.scrollToItem(at: IndexPath.init(item: sliderCounter, section: 0),
                                           at: .left,
                                           animated: true)
            pageController.currentPage = sliderCounter
            sliderCounter+=1
        }else{
            sliderCounter = 0
            collection.scrollToItem(at: IndexPath.init(item: sliderCounter, section: 0),
                                           at: .left,
                                           animated: false)
            pageController.currentPage = sliderCounter
            sliderCounter = 1
        }
    }
    /*-------------------------------------------------*/
    ////////////////////////////////////////////
    func PageConroller(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,pageCount:Int,view:UIView){
        pageController.frame = CGRect(x: x, y: y, width: width, height: height)
        pageController.numberOfPages = pageCount
        pageController.currentPage = 0
        view.addSubview(pageController)
    }
    ////////////////////////////////////////////////
        func DatePicker(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,bkcolor:UIColor,mode:UIDatePicker.Mode,formatisDate:Bool,view:UIView) {
            datePicker.frame = CGRect(x: x, y: y, width: width, height: height)
            datePicker.timeZone = NSTimeZone.local
            datePicker.datePickerMode = mode
            datePicker.backgroundColor = bkcolor
            datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
            view.addSubview(datePicker)

            let dateFormatter = DateFormatter()

            if formatisDate {
                self.datepick = true
                dateFormatter.dateFormat = datePickerFormat
            }
            else{
                dateFormatter.dateFormat = timePickerFormat
                datePicker.minuteInterval = 15
//                For 24 Hrs
//                datePicker.locale = Locale(identifier: "en_GB")
//                For 12 Hrs
//                datePicker.locale = Locale(identifier: "en_US")
            }

            selectedDate = dateFormatter.string(from: datePicker.date)
        }
        @objc func datePickerValueChanged(_ sender: UIDatePicker){
            // "MM/dd/yyyy hh:mm a"
            let dateFormatter: DateFormatter = DateFormatter()
            if datepick {
                dateFormatter.dateFormat = self.datePickerFormat
            }else{dateFormatter.dateFormat = self.timePickerFormat}
            selectedDate = dateFormatter.string(from: sender.date)
            print("\(selectedDate)")
        }

        ////////////////////////////////////////////////
    /*---------------------------*/
    func ImagePicker(any:Any,imagview:UIImageView,contentMode:UIView.ContentMode){
        imagpickerDelegate.use(any: any) {
            imagview.contentMode = contentMode
            imagview.image = self.imagpickerDelegate.imag
        }
        imagpicker.allowsEditing = true
        imagpicker.sourceType = .photoLibrary
        imagpicker.delegate = imagpickerDelegate
        (any as! UIViewController).present(imagpicker, animated: true)
    }
    func cameraImagePicker(any:Any,imagview:UIImageView,contentMode:UIView.ContentMode){
        imagpickerDelegate.use(any: any) {
            imagview.contentMode = contentMode
            imagview.image = self.imagpickerDelegate.imag
        }
        imagpicker.allowsEditing = true
        imagpicker.sourceType = .camera
        imagpicker.delegate = imagpickerDelegate
        (any as! UIViewController).present(imagpicker, animated: true)
    }
    func takePhoto(any:Any,Title:String,Description:String,imagview:UIImageView,contentMode:UIView.ContentMode){
        let alert = UIAlertController(title: Title, message: Description, preferredStyle:  .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            let camera = UI()
            camera.cameraImagePicker(any: any, imagview: imagview, contentMode: contentMode)
        }))
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { (action) in
            let picker = UI()
            picker.ImagePicker(any: any, imagview: imagview, contentMode: contentMode)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        (any as! UIViewController).present(alert, animated: true)
    }
    /*---------------------------*/
    func TableView(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,bkcolor:UIColor,border:CGFloat,borderColor:UIColor,separatorColor:UIColor,Sections:Int,SectionHeight:CGFloat,SectionHEIGHT:@escaping () -> Void,sectionView:@escaping () -> Void,rows:Int,Rows:@escaping () -> Void,editing:Bool,cellheight:CGFloat,CellHeight:@escaping () -> Void,Cellview:@escaping () -> Void,onDelete:@escaping () -> Void,view:UIView) {
        
        tableDelegate.use(editing: editing, numberOFsections: Sections, sectionHeight: SectionHeight, SectionHeight: {
            SectionHEIGHT()
        }, sectionView: {
            sectionView()
        }, numberOFrows: rows, Numberofrows: {
            Rows()
        }
, cellheight: cellheight, CellHeight: {
            CellHeight()
        }, Cellview: {
            Cellview()
        }) {
            onDelete()
        }

        if table.superview == nil {
            table.frame = CGRect(x: x, y: y, width: width, height: height)
            table.layer.masksToBounds = true
            table.layer.borderWidth = border
            table.layer.borderColor = borderColor.cgColor
            table.separatorColor = separatorColor
            table.backgroundColor = bkcolor
            table.delegate = tableDelegate
            table.dataSource = tableDelegate
            table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            view.addSubview(table)
        }
        
    }
    
    /*---------------------------*/
    func CollectionView(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,bkcolor:UIColor,scrolldirection:UICollectionView.ScrollDirection,isPaging:Bool,InterSpaceHorizontal:CGFloat,InterSpaceVertical:CGFloat,numberOFcells:Int,cellsize:@escaping ()->Void,cellmargin:@escaping ()->Void,cellview:@escaping ()->Void,view:UIView) {
        collection = UICollectionView(frame: CGRect(x: x, y: y, width: width, height: height), collectionViewLayout: collectionDelegate.layout)
        collection.backgroundColor = bkcolor
        collection.isPagingEnabled = isPaging
        collectionDelegate.layout.scrollDirection = scrolldirection
        collectionDelegate.layout.minimumInteritemSpacing = InterSpaceHorizontal
        collectionDelegate.layout.minimumLineSpacing = InterSpaceVertical
        
        collectionDelegate.use(numberofcells: numberOFcells, cellsize: {
            cellsize()
        }, cellmargin: {
            cellmargin()
        }, cellview: {
            cellview()
        })
        
        if collection.superview == nil {
            collection.delegate = collectionDelegate
            collection.dataSource = collectionDelegate
            collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            view.addSubview(collection)
        }
    }
    /*----------------------------------*/
    func CheckBox(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,trueImage:UIImage,falseImage:UIImage,isTrue:Bool,view:UIView,onClick:@escaping () -> Void) {
        
        checkBoxtrueimage = trueImage
        checkboxfalseimage = falseImage
        checkBoxfunc = onClick
        
        checkBox.frame = CGRect(x: x, y: y, width: width, height: height)
        if isTrue {
            checkBox.setBackgroundImage(trueImage, for: .normal)
            isCheckBoxChecked = isTrue
        }else{
            checkBox.setBackgroundImage(falseImage, for: .normal)
            isCheckBoxChecked = isTrue
        }
        checkBox.addTarget(self, action: #selector(oncheckClick), for: .touchUpInside)
        view.addSubview(checkBox)
    }
    @objc func oncheckClick(){
        if self.isCheckBoxChecked {
            self.checkBox.setBackgroundImage(self.checkboxfalseimage, for: .normal)
            self.isCheckBoxChecked = false
        }else{
            self.checkBox.setBackgroundImage(self.checkBoxtrueimage, for: .normal)
            self.isCheckBoxChecked = true
        }
        self.checkBoxfunc()
    }
    
    ///////////////////////////////
    func Arc(x:CGFloat, y:CGFloat,startAngle:CGFloat, endAngle:CGFloat, radius:CGFloat,fillcolor:UIColor,view: UIView) {
        
        //if angle is anticlock wise
        var SA:CGFloat!
        var EA:CGFloat!
        var clockwise:Bool!
        if startAngle >= 0 && endAngle >= 0{
            SA = startAngle
            EA = endAngle
            if startAngle < endAngle{
                clockwise = true
            }
            else{
                clockwise = false
            }
            
        }
        else if startAngle <= 0 && endAngle <= 0{
            SA = 360 + startAngle
            EA = 360 + endAngle
            if startAngle > endAngle{
                clockwise = false
            }
            else{
                clockwise = true
            }
        }
        else if startAngle >= 0 && endAngle <= 0{
            SA = startAngle
            EA = 360 + endAngle
            clockwise = false
        }
        else if startAngle <= 0 && endAngle >= 0{
            SA = 360 + startAngle
            EA = endAngle
            clockwise = true
        }
        
        
        /*--make shape--*/
        cgpath.removeAllPoints()
        cgpath.move(to: CGPoint(x: x, y: y))
        cgpath.addArc(withCenter: CGPoint(x: x, y: y), radius: radius, startAngle: Radian(SA), endAngle: Radian(EA), clockwise: clockwise)
        cgpath.close()
        
        /*--final step--*/
        arc.path = cgpath.cgPath
        arc.fillColor = fillcolor.cgColor
        view.layer.addSublayer(arc)
        
    }
    
    func line(p1:CGPoint,p2:CGPoint,lineWidth:CGFloat,color:UIColor,view:UIView) {
        cgpath.removeAllPoints()
        triangle.isHidden = false
        
        /*--make shape--*/
        cgpath.move(to: p1)
        cgpath.addLine(to: p2)
        
        /*--final step--*/
        line.path = cgpath.cgPath
        line.strokeColor = color.cgColor
        line.lineWidth = lineWidth
        view.layer.addSublayer(line)
    }
    func lineframe(p1:CGPoint,p2:CGPoint) {
        cgpath.removeAllPoints()
        cgpath.move(to: p1)
        cgpath.addLine(to: p2)
        line.path = cgpath.cgPath
    }
    
    
    func Toastmessage(y:CGFloat,_ Text:String,txtColor:UIColor,bkColor:UIColor,fontsize:CGFloat,view:UIView) {
        toastmsg.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0.5, options: [], animations: {
            self.toastmsg.alpha = 1
        })
        
        toastmsg.text = Text
        toastmsg.textColor = txtColor
        toastmsg.backgroundColor = bkColor
        toastmsg.layer.cornerRadius = 20
        toastmsg.numberOfLines = 10
        toastmsg.layer.masksToBounds = true
        toastmsg.font = UIFont.systemFont(ofSize: fontsize)
        toastmsg.textAlignment = .center
        toastmsg.sizeToFit()
        if toastmsg.frame.size.width > (view.frame.size.width - 20) {
            toastmsg.frame.size.width = view.frame.size.width - 20
            toastmsg.sizeToFit()
        }
        else{
            toastmsg.frame.size.width = toastmsg.frame.size.width + 20
        }
        toastmsg.frame.size.height = toastmsg.frame.size.height + 20
        toastmsg.frame.origin.x = view.frame.midX - toastmsg.frame.size.width/2
        toastmsg.frame.origin.y = y
        view.addSubview(toastmsg)
        view.bringSubviewToFront(toastmsg)
        
        time.delay(milliSec: 2500) {
            UIView.animate(withDuration: 1) {self.toastmsg.alpha = 0}
            time.delay(milliSec: 1000, code: {self.toastmsg.removeFromSuperview()})
        }
        
    }
    
    
    
    func ComboBox(_ list:[String],_ defaultTextindex:Int,x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,bkcolor:UIColor,txtcolor:UIColor,cornerRadius:CGFloat,editable:Bool,placeholder:String,fontsize:CGFloat,iconColor:UIColor,listbkcolor:UIColor,listTextcolor:UIColor,view:UIView, runAfter:@escaping () -> Void) {
        comboBoxrunAfter = runAfter
        
        if iscomboBoxcreated == false {
            comboBox.frame = CGRect(x: x, y: y, width: width, height: height)
            view.addSubview(comboBox)
            
            // scroll
            
            let scroll = UIScrollView()
            scroll.frame = CGRect(x: 0, y: height/2, width: width, height: 0)
            scroll.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            scroll.contentSize.width = width
            comboBox.addSubview(scroll)
            
            // textfield
            
            let textfield = UITextField()
            textfield.frame = CGRect(x: 0, y: 0, width: width, height: height)
            textfield.backgroundColor = bkcolor
            textfield.textColor = txtcolor
            if defaultTextindex >= 0 {
                textfield.text = list[defaultTextindex]
            }
            textfield.layer.cornerRadius = cornerRadius
            textfield.isUserInteractionEnabled = editable
            textfield.font = UIFont.systemFont(ofSize: fontsize)
            textfield.placeholder = placeholder
            textfield.textAlignment = .center
            comboBox.addSubview(textfield)
            
            // click icon
            let iconbtn = UIView()
            iconbtn.frame = CGRect(x: width - 17, y: 0, width: 15, height: height)
            iconbtn.layer.cornerRadius = cornerRadius
            comboBox.addSubview(iconbtn)
            
            let cgpath = UIBezierPath()
            cgpath.removeAllPoints()
            cgpath.move(to: CGPoint(x: 0, y: height/2 - 5))
            cgpath.addLine(to: CGPoint(x: 14, y: height/2  - 5))
            cgpath.addLine(to: CGPoint(x: 7, y: height/2 + 5))
            cgpath.close()
            
            let triangle = CAShapeLayer()
            triangle.path = cgpath.cgPath
            triangle.fillColor = iconColor.cgColor
            iconbtn.layer.addSublayer(triangle)
            
            iconbtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(comboBoxListOpening)))
            
            // list
            
            var labelh = height/2 + 1
            
            var labelview:[UIView] = []
            var label:[UILabel] = []
            for i in 0..<label.count {label[i].removeFromSuperview()}
            for i in 0..<list.count {
                labelview.append(UIView())
                labelview[i].frame = CGRect(x: 1, y: labelh, width: width - 2, height: 30)
                labelview[i].backgroundColor = listbkcolor
                labelview[i].tag = i
                scroll.addSubview(labelview[i])
                
                label.append(UILabel())
                label[i].frame = CGRect(x: 0, y: 0, width: labelview[i].frame.size.width, height: labelview[i].frame.size.height)
                label[i].text = list[i]
                label[i].tag = i
                label[i].font = UIFont.systemFont(ofSize: 13, weight: .light)
                label[i].textColor = listTextcolor
                label[i].textAlignment = .center
                labelview[i].addSubview(label[i])
                
                labelh += 31
                scroll.contentSize.height = labelh
                if labelh > 100 {scroll.frame.size.height = 100}
                else{scroll.frame.size.height = labelh}
                scroll.isHidden = true
                labelview[i].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(comboBoxChoose)))
            }
        }
        
        iscomboBoxcreated = true
    }
        
    @objc func comboBoxListOpening(){
        // 0 scroll
        // 1 textfield
        if comboBox.subviews[0].isHidden {
            comboBox.frame.size.height = comboBox.subviews[1].frame.size.height/2 + comboBox.subviews[0].frame.size.height
            comboBox.subviews[0].isHidden = false
        }
        else{
            self.comboBox.subviews[0].isHidden = true
            self.comboBox.frame.size.height = (self.comboBox.frame.size.height - self.comboBox.subviews[0].frame.size.height) * 2
        }
//        comboBoxrunAfter()
    }
    @objc func comboBoxChoose(_ tap:UITapGestureRecognizer){
        coreAnimation.Scale(start: 1, end: 0.8, duration: 0.1, repeatCount: 1, autoReverse: true, view: tap.view!)
        
        comboBox.text_comboBox(comboBox.label_comboBox(tap.view!))
        time.delay(milliSec: 100) {
            self.comboBox.subviews[0].isHidden = true
            self.comboBox.frame.size.height = (self.comboBox.frame.size.height - self.comboBox.subviews[0].frame.size.height) * 2
            self.comboBoxrunAfter()
        }
        
    }
    
    
    
    func Input(multiline:Bool, x:CGFloat, y:CGFloat, width:CGFloat, labelheight:CGFloat, inputheight:CGFloat, cornerRadius:CGFloat, fontsize:CGFloat, label:String, labelbkcolor:UIColor, labelcolor:UIColor, inputplaceholder:String, inputbk:UIColor, inputcolor:UIColor, inputborderColor:UIColor, view:UIView) {
        
        
        // view
        var bkframeheight:CGFloat!
        if multiline {
            bkframeheight = labelheight + inputheight + 5
        }
        else{
            bkframeheight = inputheight
        }
        
        input.frame = CGRect(x: x, y: y, width: width, height: bkframeheight)
        view.addSubview(input)
        
        
        // label
        
        let l = UILabel()
        l.frame.origin = CGPoint(x: 0, y: 0)
        l.backgroundColor = labelbkcolor
        l.text = label
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: fontsize)
        l.textColor = labelcolor
        l.textAlignment = .center
        l.layer.cornerRadius = cornerRadius
        l.layer.masksToBounds = true
        l.sizeToFit()
        l.frame.size.width = l.frame.size.width + 20
        l.frame.size.height = labelheight
        input.addSubview(l)
        
        
        // textfield
        var inputwidth:CGFloat!
        var inputx:CGFloat!
        var inputy:CGFloat!
        if multiline {
            inputwidth = width
            inputx = 0
            inputy = l.frame.maxY + 5
        }
        else{
            inputwidth = input.frame.size.width - l.frame.size.width
            inputx = l.frame.maxX
            inputy = 0
        }
        
        
        if multiline {
            let t = UITextView.init()
            t.frame = CGRect(x: inputx, y: inputy, width: inputwidth, height: inputheight)
            t.textAlignment = .center
            t.font = UIFont.systemFont(ofSize: fontsize)
            t.layer.borderWidth = 1
            t.layer.borderColor = inputborderColor.cgColor
            t.layer.backgroundColor = inputbk.cgColor
            t.layer.cornerRadius = cornerRadius
            t.keyboardType = UIKeyboardType.default
            input.addSubview(t)
        }
        else{
            let t = UITextField.init()
            t.frame = CGRect(x: inputx, y: inputy, width: inputwidth, height: inputheight)
            t.textAlignment = .center
            t.placeholder = inputplaceholder
            t.layer.borderWidth = 1
            t.layer.borderColor = inputborderColor.cgColor
            t.layer.backgroundColor = inputbk.cgColor
            t.layer.cornerRadius = cornerRadius
            t.keyboardType = UIKeyboardType.default
            input.addSubview(t)
        }
        
        
        
    }
    
    func ClickAbleViewImage(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,image:UIImage,any: Any, Tapfunction:Selector,view:UIView) {
        
        clickAbleViewImage.frame = CGRect(x: x, y: y, width: width, height: height)
        clickAbleViewImage.BackgroundImage(image: image)
        view.addSubview(clickAbleViewImage)
        
        clickAbleViewImage.addGestureRecognizer(UITapGestureRecognizer(target: any, action: Tapfunction))
    }

    
    func LButton(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, title:String,fontSize:CGFloat, any: Any, tapfunction:Selector,cornerRadius:CGFloat, bordercolor:CGColor, bkcolor:UIColor, txtcolor:UIColor, view:UIView) {
        Lbutton.frame = CGRect(x: x, y: y, width: width, height: height)
        Lbutton.backgroundColor = bkcolor
        Lbutton.layer.cornerRadius = cornerRadius
        Lbutton.layer.borderWidth = 1
        Lbutton.layer.borderColor = bordercolor
        view.addSubview(Lbutton)
        
        Lbutton.addGestureRecognizer(UITapGestureRecognizer(target: any, action: tapfunction ))
        
        Lbuttontext.frame = CGRect(x: 0, y: 0, width: Lbutton.frame.size.width, height: Lbutton.frame.size.height)
        Lbuttontext.text = title
        Lbuttontext.font = UIFont.boldSystemFont(ofSize: fontSize)
        Lbuttontext.numberOfLines = 0
        Lbuttontext.textColor = txtcolor
        Lbuttontext.textAlignment = .left
        Lbutton.addSubview(Lbuttontext)
        
    }
    
    func drawTriangle(_ p1:CGPoint,_ p2:CGPoint,_ p3:CGPoint,bkcolor:UIColor,borderColor:UIColor,view:UIView){
        cgpath.removeAllPoints()
        triangle.isHidden = false
        
        /*--make shape--*/
        cgpath.move(to: p1)
        cgpath.addLine(to: p2)
        cgpath.addLine(to: p3)
        cgpath.close()
        
        /*--final step--*/
        triangle.path = cgpath.cgPath
        triangle.fillColor = bkcolor.cgColor
        triangle.strokeColor = borderColor.cgColor
        view.layer.addSublayer(triangle)
    }
    func Triangleframe(_ p1:CGPoint,_ p2:CGPoint,_ p3:CGPoint) {
        cgpath.removeAllPoints()
        cgpath.move(to: p1)
        cgpath.addLine(to: p2)
        cgpath.addLine(to: p3)
        cgpath.close()
        triangle.path = cgpath.cgPath
    }
   ////////////////////////////////////////////////
    func ScrollView(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, bkcolor:UIColor, contentwidth:CGFloat, contentheight:CGFloat, view:UIView) {
        scrollview.frame = CGRect(x: x, y: y, width: width, height: height)
        scrollview.backgroundColor = bkcolor
        scrollview.contentSize.width = contentwidth
        scrollview.contentSize.height = contentheight
        view.addSubview(scrollview)
    }
    
    ////////////////////////////////////////////////
    func View(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, bkcolor:UIColor,cornerRadius:CGFloat,border:CGFloat,borderColor:UIColor, view:UIView){
        self.view.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.backgroundColor = bkcolor
        self.view.layer.cornerRadius = cornerRadius
        self.view.layer.borderWidth = border
        self.view.layer.borderColor = borderColor.cgColor
        view.addSubview(self.view)
    }
    
    ////////////////////////////////////////////////
    func Label(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, txt:String, fontsize:CGFloat, bold:Bool, cornerRadius:CGFloat,border:CGFloat,borderColor:UIColor, alignment:NSTextAlignment, bkcolor:UIColor, txtcolor:UIColor, view:UIView) {
           label.frame = CGRect(x: x, y: y, width: width, height: height)
           label.backgroundColor = bkcolor
           label.text = txt
           label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.layer.cornerRadius = cornerRadius;
        label.layer.borderColor = borderColor.cgColor;
        label.layer.borderWidth = border;
        if bold {label.font = .boldSystemFont(ofSize: fontsize)}
        else{label.font = UIFont.systemFont(ofSize: fontsize)}
           label.textColor = txtcolor
           label.textAlignment = alignment
           view.addSubview(label)
       }
    func AutoSizeXLabel(x:CGFloat,y:CGFloat,height:CGFloat,txt:String,fontsize:CGFloat,bkcolor:UIColor,txtcolor:UIColor,border:CGFloat,borderColor:UIColor,cornerRadius:CGFloat,alignment:NSTextAlignment,view:UIView) {
        autoSizelabel.frame.origin = CGPoint(x: x, y: y)
        autoSizelabel.backgroundColor = bkcolor
        autoSizelabel.text = txt
        autoSizelabel.numberOfLines = 0
        autoSizelabel.font = UIFont.systemFont(ofSize: fontsize)
        autoSizelabel.textColor = txtcolor
        autoSizelabel.textAlignment = alignment
        autoSizelabel.layer.cornerRadius = cornerRadius
        autoSizelabel.layer.masksToBounds = true
        autoSizelabel.sizeToFit()
        autoSizelabel.frame.size.width = autoSizelabel.frame.size.width
        autoSizelabel.frame.size.height = height
        view.addSubview(autoSizelabel)
    }
    func AutoSizeYLabel(x:CGFloat,y:CGFloat,width:CGFloat,bkColor:UIColor,text:String,fontsize:CGFloat,txtColor:UIColor,cornerRadius:CGFloat,view:UIView){
        autoSizelabel.frame.origin = CGPoint(x: x, y: y)
        autoSizelabel.frame.size.width = width
        autoSizelabel.backgroundColor = bkColor
        autoSizelabel.text = text
        autoSizelabel.numberOfLines = 0
        autoSizelabel.font = UIFont.systemFont(ofSize: fontsize)
        autoSizelabel.textColor = txtColor
        autoSizelabel.textAlignment = .center
        autoSizelabel.layer.cornerRadius = cornerRadius
        autoSizelabel.layer.masksToBounds = true
        autoSizelabel.sizeToFit()
        view.addSubview(autoSizelabel)
    }
    func Textfield(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, placeholder:String,border:CGFloat,borderRadius:CGFloat,txtAlign:NSTextAlignment, bordercolor: CGColor,keyboard:UIKeyboardType,textColor:UIColor, bkcolor:UIColor, view:UIView ) {
        txtfield.frame = CGRect(x: x, y: y, width: width, height: height)
        txtfield.textAlignment = txtAlign
        txtfield.textColor = textColor
        txtfield.placeholder = placeholder
        txtfield.layer.borderWidth = border
        txtfield.layer.borderColor = bordercolor
        txtfield.layer.backgroundColor = bkcolor.cgColor
        txtfield.layer.cornerRadius = borderRadius
        txtfield.keyboardType = keyboard
        view.addSubview(txtfield)
    }
    func TextView(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,border:CGFloat,text:String,cornerRadius:CGFloat,borderColor:UIColor,size:CGFloat,weight:UIFont.Weight,bkColor:UIColor,textColor:UIColor,align:NSTextAlignment,view:UIView) {
           txtview.frame = CGRect(x: x, y: y, width: width, height: height)
           txtview.layer.borderWidth = border
           txtview.layer.cornerRadius = cornerRadius
           txtview.layer.borderColor = borderColor.cgColor
           txtview.backgroundColor = bkColor
           txtview.textColor = textColor
           txtview.textAlignment = align
           txtview.font = UIFont.systemFont(ofSize: 20, weight: weight)
           txtview.text = text
           view.addSubview(txtview)
       }
    
    func Button(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, title:String,fontsize:CGFloat, any: Any, function:Selector,cornerRadius:CGFloat, bordercolor:UIColor, bkcolor:UIColor, txtcolor:UIColor, view:UIView) {
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontsize, weight: .regular)
        button.layer.borderWidth = 1
        button.layer.borderColor = bordercolor.cgColor
        button.layer.backgroundColor = bkcolor.cgColor
        button.layer.cornerRadius = cornerRadius
        button.addTarget(any, action: function, for: .touchUpInside)
        button.tintColor = txtcolor
//        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize)
        view.addSubview(button)
    }
    
    func Backgroundimage(src:UIImage ,view: UIView) {
        imag.image = src
        imag.contentMode = .scaleToFill
        imag.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imag)
        
        
        imag.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imag.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imag.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imag.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func Image(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,mode:UIView.ContentMode, imageUrl:String, view:UIView){
//        "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.seilevel.com%2Frequirements%2Fwp-content%2Fplugins%2Fstormhill_author_page%2Fimg%2Fimage-not-found.png"
        self.imag.loadimage(url: URL(string: imageUrl)!)
        imag.frame = CGRect(x: x, y: y, width: width, height: height)
        imag.contentMode = mode
        view.addSubview(imag)
        
    }
        func Image(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,mode:UIView.ContentMode, src: UIImage, view:UIView){
            imag.image = src
            imag.frame = CGRect(x: x, y: y, width: width, height: height)
            imag.contentMode = mode
            view.addSubview(imag)
            
        }
    
    
    
    func clickableimage(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat,image: UIImage,cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor, function:Selector, any:Any, view:UIView ) {
        clickableimg.setBackgroundImage(image, for: .normal)
        clickableimg.frame = CGRect(x: x, y: y, width: width, height: height)
        clickableimg.layer.masksToBounds = true
        clickableimg.layer.cornerRadius = cornerRadius
        clickableimg.layer.borderWidth = borderWidth
        clickableimg.layer.borderColor = borderColor.cgColor
        clickableimg.addTarget(any, action: function, for: .touchUpInside)
        view.addSubview(clickableimg)
    }
    
    func clickableimage(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat,image: UIImage,cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor, function:Selector, any:Any,imgurl:String?, view:UIView ) {
        if let str = imgurl
        {
            clickableimg.load(url: URL(string: str)!)
            
        }
        else
        {
            clickableimg.setBackgroundImage(image, for: .normal)
        }
        clickableimg.frame = CGRect(x: x, y: y, width: width, height: height)
        clickableimg.layer.masksToBounds = true
        clickableimg.layer.cornerRadius = cornerRadius
        clickableimg.layer.borderWidth = borderWidth
        clickableimg.layer.borderColor = borderColor.cgColor
        clickableimg.addTarget(any, action: function, for: .touchUpInside)
        view.addSubview(clickableimg)
    }
    
    func simplemessagebox(txt: String,any:Any,okfunction:Selector,view:UIView){
        msgbox.isHidden = false
        msgbox.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        msgbox.backgroundColor = UIColor(red: 28/255, green: 29/255, blue: 30/255, alpha: 0.9)
        view.addSubview(msgbox)
        ////////
        self.view.layer.borderWidth = 1
        self.view.layer.borderColor = UIColor.black.cgColor
        self.view.layer.cornerRadius = 20
        View(x: (x/100)*10, y: (y/100)*30, width: (x/100)*80, height: (y/100)*30, bkcolor: .white, cornerRadius: 0, border: 0, borderColor: .clear, view: msgbox)
        let viewX = self.view.frame.size.width
        let viewY = self.view.frame.size.height
        ////////
        Label(x: (viewX/100)*5, y: (viewY/100)*10, width: (viewX/100)*90, height: (viewY/100)*80, txt: txt,
              fontsize: 20, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: UIColor(red: 19/255, green: 39/255, blue: 39/255, alpha: 1), view: self.view)
        ////////
        Button(x: (x/100)*10, y: self.view.frame.maxY + 20, width: (x/100)*80, height: 40, title: "OK", fontsize: 14, any: any, function: okfunction, cornerRadius: 20, bordercolor: UIColor.black, bkcolor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5), txtcolor: UIColor.black, view: msgbox)
        
        
    }
    
    func optionMessagebox(txt: String,any:Any,okfunction:Selector,cancelfunction:Selector,view:UIView){
        msgbox.isHidden = false
        msgbox.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        msgbox.backgroundColor = UIColor(red: 28/255, green: 29/255, blue: 30/255, alpha: 0.9)
        view.addSubview(msgbox)
        ////////
        self.view.layer.borderWidth = 1
        self.view.layer.borderColor = UIColor.black.cgColor
        self.view.layer.cornerRadius = 20
        View(x: (x/100)*10, y: (y/100)*30, width: (x/100)*80, height: (y/100)*30, bkcolor: .white, cornerRadius: 0, border: 0, borderColor: .clear, view: msgbox)
        let viewX = self.view.frame.size.width
        let viewY = self.view.frame.size.height
        ////////
        Label(x: (viewX/100)*5, y: (viewY/100)*10, width: (viewX/100)*90, height: (viewY/100)*80, txt: txt,
              fontsize: 20, bold: false, cornerRadius: 0, border: 0, borderColor: .clear, alignment: .left, bkcolor: UIColor.clear, txtcolor: UIColor(red: 19/255, green: 39/255, blue: 39/255, alpha: 1), view: self.view)
        ////////
        let a = UI()
        a.Button(x: (x/100)*10, y: self.view.frame.maxY + 20, width: (x/100)*80, height: 40, title: "OK", fontsize: 14, any: any, function: okfunction, cornerRadius: 20, bordercolor: UIColor.black, bkcolor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5), txtcolor: UIColor.black, view: msgbox)
        let b = UI()
        b.Button(x: (x/100)*10, y: a.button.frame.maxY + 5, width: (x/100)*80, height: 40, title: "Cancel", fontsize: 14, any: any, function: cancelfunction, cornerRadius: 20, bordercolor: UIColor.black, bkcolor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5), txtcolor: UIColor.black, view: msgbox)
        
        
    }
    
    
    
    func keyboardWillShow(any:Any,onShow:Selector){
        NotificationCenter.default.addObserver(any, selector: onShow, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    
}


// MARK:- Constraints

extension UIView {
    func leading(_ equalTo:NSLayoutXAxisAnchor,constant:CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    func trailing(_ equalTo:NSLayoutXAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    func left(_ equalTo:NSLayoutXAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    func right(_ equalTo:NSLayoutXAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rightAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func top(_ equalTo:NSLayoutYAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    func bottom(_ equalTo:NSLayoutYAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    func width(constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    func width_lessThanorEqualTo(constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }
    func height_lessThanorEqualTo(constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }
    func height_GreterThanorEqualTo(constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
    }
    func height(constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true

    }
    func centerX(_ equalTo:NSLayoutXAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    func centerY(_ equalTo:NSLayoutYAxisAnchor,constant:CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: equalTo, constant: constant).isActive = true
    }
    
    
}



// MARK:- Extension UIButton

extension UIButton {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.setBackgroundImage(image, for: .normal)
                    }}
            }}
    }
    
    
    
    
    
    func bouncybutton(code:@escaping ()->Void) {
        //////////////////// Animation
        let txtcolor = self.tintColor
        let bkcolor = self.backgroundColor
        playSystemSound(.Null)
        UIView.animate(withDuration: 0.08, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.tintColor = bkcolor
            self.backgroundColor = txtcolor
        }) { _ in
            self.transform = .identity
            self.tintColor = txtcolor
            self.backgroundColor = bkcolor
        }
        //////////////// Code Here
        time.delay(milliSec: 100) {
            code()
        }
    }    
    
}




// MARK:- Extension UIImageView

extension UIImageView {
    func loadimage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {self?.image = image}
                }}
        }
    }
    
    func toBase64(quality:CGFloat) -> String {
        let imageData = self.image?.jpegData(compressionQuality: quality)
        return "data:image/jpeg;base64,"+imageData!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
    }
}

// MARK:- Extension UIViewController
extension UIViewController {
    func shareOnSocialMedia(Content:[Any],ONsuccess:@escaping () -> Void,ONfail:@escaping () -> Void){
        let share = UIActivityViewController(activityItems: Content, applicationActivities: nil)
        share.completionWithItemsHandler = {(nil, completed, _ , error) in
            if completed {
                ONsuccess()
            }else{
                ONfail()
            }
        }
        self.present(share, animated: true)
    }
    
    func showAlert(Title:String,Message:String){
        let alert = UIAlertController(title: Title, message: Message, preferredStyle:  .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    func startLoader(){
        var loader = MBProgressHUD()
        loader = MBProgressHUD.showAdded(to: self.view, animated: false)
        loader.mode = MBProgressHUDMode.indeterminate
        loader.animationType = .fade
        loader.label.text = "Loading..."
        loader.label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        loader.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        loader.backgroundView.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7)
    }
    func stopLoader(){
        MBProgressHUD.hide(for: self.view, animated: false)
    }
}



// MARK:- Extension UIView

public enum innerShadowSide{
    case all, left, right, top, bottom, topAndLeft, topAndRight, bottomAndLeft, bottomAndRight, exceptLeft, exceptRight, exceptTop, exceptBottom
}

extension UIView {
    
    // different inner shadow styles
//    public enum innerShadowSide
//    {
//        case all, left, right, top, bottom, topAndLeft, topAndRight, bottomAndLeft, bottomAndRight, exceptLeft, exceptRight, exceptTop, exceptBottom
//    }
    
    // define function to add inner shadow
    public func innerShadow(onSide: innerShadowSide, shadowColor: UIColor, shadowSize: CGFloat)
    {
        // define and set a shaow layer
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = shadowSize
        shadowLayer.fillRule = CAShapeLayerFillRule.evenOdd
        
        // define shadow path
        let shadowPath = CGMutablePath()
        
        // define outer rectangle to restrict drawing area
        let insetRect = bounds.insetBy(dx: -shadowSize * 2.0, dy: -shadowSize * 2.0)
        
        // define inner rectangle for mask
        let innerFrame: CGRect = { () -> CGRect in
            switch onSide
            {
                case .all:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
                case .left:
                    return CGRect(x: 0.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 4.0)
                case .right:
                    return CGRect(x: -shadowSize * 2.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 4.0)
                case .top:
                    return CGRect(x: -shadowSize * 2.0, y: 0.0, width: frame.size.width + shadowSize * 4.0, height: frame.size.height + shadowSize * 2.0)
                case.bottom:
                    return CGRect(x: -shadowSize * 2.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 4.0, height: frame.size.height + shadowSize * 2.0)
                case .topAndLeft:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .topAndRight:
                    return CGRect(x: -shadowSize * 2.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .bottomAndLeft:
                    return CGRect(x: 0.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .bottomAndRight:
                    return CGRect(x: -shadowSize * 2.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .exceptLeft:
                    return CGRect(x: -shadowSize * 2.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height)
                case .exceptRight:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height)
                case .exceptTop:
                    return CGRect(x: 0.0, y: -shadowSize * 2.0, width: frame.size.width, height: frame.size.height + shadowSize * 2.0)
                case .exceptBottom:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height + shadowSize * 2.0)
            }
        }()
        
        
        // add outer and inner rectangle to shadow path
        shadowPath.addRect(insetRect)
        shadowPath.addRect(innerFrame)
//        shadowPath.addRoundedRect(in: insetRect, cornerWidth: 0, cornerHeight: 0)
//        shadowPath.addRoundedRect(in: innerFrame, cornerWidth: self.layer.cornerRadius, cornerHeight: self.layer.cornerRadius)

        
        // set shadow path as show layer's
        shadowLayer.path = shadowPath
        
        // add shadow layer as a sublayer
        layer.addSublayer(shadowLayer)
        // hide outside drawing area
        clipsToBounds = true
    }
    
    
    func textfield_comboBox() -> UITextField {
        // 0 scroll
        // 1 textfield
        return self.subviews[1] as! UITextField
    }
    
    func text_comboBox() -> String {
        // 0 scroll
        // 1 textfield
        let txtfield:UITextField = self.subviews[1] as! UITextField
        return txtfield.text!
    }
    
    func text_comboBox(_ text:String) {
        // 0 scroll
        // 1 textview
        let txtfield:UITextField = self.subviews[1] as! UITextField
        txtfield.text = text
    }
    
    func  label_comboBox(_ labelview:UIView) -> String {
        // 0 scroll
        var label:UILabel!
        let scroll:UIScrollView = self.subviews[0] as! UIScrollView
        for view in scroll.subviews {
            if labelview ==  view {
                label = view.subviews[0] as? UILabel
            }
        }
        return label.text!
    }
    
    func color_inputLabel(_ color:UIColor) {
        let label:UILabel = self.subviews[0] as! UILabel
        label.textColor = color
    }
    
    func backgroundcolor_inputLabel(_ color:UIColor) {
        let label:UILabel = self.subviews[0] as! UILabel
        label.backgroundColor = color
    }
    
    func Text_input(_ isTextField:Bool,_ text:String) {
        if isTextField {
            let t:UITextField = self.subviews[1] as! UITextField
            t.text = text
        }
        else{
            let t:UITextView = self.subviews[1] as! UITextView
            t.text = text
        }
    }
    
    func textField_input() -> UITextField {
        return self.subviews[1] as! UITextField
    }
    
    func textView_input() -> UITextView {
        return self.subviews[1] as! UITextView
    }
    
    func Text_input(_ istextField:Bool) -> String {
        if istextField {
            let text:UITextField = self.subviews[1] as! UITextField
            return text.text!
        }
        else{
            let text:UITextView = self.subviews[1] as! UITextView
            return text.text!
        }
        
    }
    
    func BackgroundImage(image:UIImage) {
        UIGraphicsBeginImageContext(self.frame.size)
        image.draw(in: self.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.backgroundColor = UIColor.init(patternImage: image!)
    }
    
    func Text(_ string:String) {
        let label:UILabel =  self.subviews[0] as! UILabel
        label.text = string
    }

    func text() -> String {
        let label:UILabel =  self.subviews[0] as! UILabel
        return label.text!
    }
    
    func textcolor(_ color:UIColor) {
        let label:UILabel =  self.subviews[0] as! UILabel
        label.textColor = color
    }
    
    func removeText() {
        let label:UILabel =  self.subviews[0] as! UILabel
        label.removeFromSuperview()
    }
    
}































// MARK:- Extension UITextField

struct UITextFieldClass {
    static var inputDataType:[Int:Any] = [:]
}
extension UITextField {
    
    func getText(_ textfield:UITextField) -> String{
        let fpn = FPN()
        return fpn.gettext(textfield)
    }
    
    func isValid(_ textfield:UITextField) -> Bool{
        let fpn = FPN()
        return fpn.isValid(textfield)
    }
    
    func inputDataType(_ dataType:Any) /* eg. dataType: Double() */ {
        UITextFieldClass.inputDataType[addressOF(self)] = dataType
        self.addTarget(self, action: #selector(inputDataType_onEditChanged), for: .editingChanged)
        
    }
    
    @objc func inputDataType_onEditChanged(){
        
        if type(of: UITextFieldClass.inputDataType[addressOF(self)]!) == Int.self && self.text! != "" {
            if (self.text!.last! != "0")
                && (self.text!.last! != "1")
                && (self.text!.last! != "2")
                && (self.text!.last! != "3")
                && (self.text!.last! != "4")
                && (self.text!.last! != "5")
                && (self.text!.last! != "6")
                && (self.text!.last! != "7")
                && (self.text!.last! != "8")
                && (self.text!.last! != "9") {self.text!.removeLast()}
        }
        else if type(of: UITextFieldClass.inputDataType[addressOF(self)]!) == Double.self && self.text! != "" {
            
            if (self.text?.filter{$0 == "."}.count)!>1 {self.text!.removeLast()}
            if self.text! == "." {self.text = "0."}
            
            if (self.text!.last! != "0")
                && (self.text!.last! != "1")
                && (self.text!.last! != "2")
                && (self.text!.last! != "3")
                && (self.text!.last! != "4")
                && (self.text!.last! != "5")
                && (self.text!.last! != "6")
                && (self.text!.last! != "7")
                && (self.text!.last! != "8")
                && (self.text!.last! != "9")
                && (self.text!.last! != ".") {self.text!.removeLast()}

        }

    }
    
    
}


// MARK:- Notification Extension

extension NSNotification{
    func keyboardFrame() -> CGRect{
        return ((self.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)!.cgRectValue)
    }
}




























































// MARK:- TextField Delegate

class FPN:UIView, FPNTextFieldDelegate {
    
    public func gettext(_ textfield:UITextField) -> String {
        fpnDidValidatePhoneNumber(textField: textfield as! FPNTextField, isValid: true)
        return str
    }
    
    public func isValid(_ textfield:UITextField) -> Bool {
        fpnDidValidatePhoneNumber(textField: textfield as! FPNTextField, isValid: true)
        return valid
    }
    
    private var str = String()
    private var valid = false
    
    internal func fpnDisplayCountryList() {
    }
    internal func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code) // Output "France", "+33", "FR"
    }
    internal func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            str = textField.getFormattedPhoneNumber(format: .E164)!
        }
        if str.contains("null") {
            self.valid = false
        }
        else{
            self.valid = true
        }
    }
}





























// MARK:- TableView Delegate
class TVC:UIView,UITableViewDelegate,UITableViewDataSource {
    
    var Model = UIView()
    var numberOFrows = Int()
    var Rows:() -> () = {}
    
    var cellheight = CGFloat()
    var CellHeight:() -> () = {}
    var cellview:() -> () = {}
    var cell = UITableViewCell()
    
    var sectionview = UIView()
    
    var numberOFsections = Int()
    var sectionheight = CGFloat()
    var SectionHeight:() -> () = {}
    var sectionView:() -> () = {}
    
    var index = Int()
    var section = Int()
    var editing = false
    var ondelete:() -> () = {}
    
    func use(editing:Bool,numberOFsections:Int,sectionHeight:CGFloat,SectionHeight:@escaping () -> Void,sectionView:@escaping () -> Void,numberOFrows:Int,Numberofrows:@escaping () -> Void,cellheight:CGFloat,CellHeight:@escaping () -> Void,Cellview:@escaping () -> Void,onDel:@escaping () -> Void) {
        self.editing = editing
        self.ondelete = {onDel()}

        self.numberOFrows = numberOFrows
        self.Rows = {Numberofrows()}
            
        self.cellheight = cellheight
        self.CellHeight = {CellHeight()}
        self.cellview = {Cellview()}
        
        self.numberOFsections = numberOFsections
        self.sectionheight = sectionHeight
        self.SectionHeight = {SectionHeight()}
        
        self.sectionView = {sectionView()}
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section = section
        self.Rows()
        return numberOFrows
    }
    
    // CELL VIEW
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        self.section = indexPath.section
        self.index = indexPath.row
        self.cellview()
        return cell
    }
    
    //height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        index = indexPath.row
        CellHeight()
        return cellheight
    }
    
    
    // delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return editing
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        index = indexPath.row
        section = indexPath.section
        if editingStyle == .delete {
            self.ondelete()
        }
    }
    
    
    // number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOFsections
    }
    // section header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        self.section = section
        self.SectionHeight()
        return sectionheight
    }
    // section view header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: sectionheight))
        self.section = section
        sectionview = view
        sectionView()
        return sectionview
    }
    
}


// MARK:- CollectionView Delegate
class CVC:UIView,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    
    let layout = UICollectionViewFlowLayout()
    var NumberOFcells = Int()
    var cellView:() -> () = {}
    var cell = UICollectionViewCell()
    var cellSize = CGSize()
    var CellSize:()->() = {}
    var cellMargin = UIEdgeInsets()
    var CellMargin:()->() = {}
    
    var index = Int()
    var section = Int()
    
    func use(numberofcells:Int,cellsize:@escaping () -> Void,cellmargin:@escaping ()-> Void,cellview:@escaping () -> Void) {
        
        
        NumberOFcells = numberofcells
        CellSize = {cellsize()}
        cellView = {cellview()}
        CellMargin = {cellmargin()}
        
    }
    
    // cells Count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NumberOFcells
    }
    
    
    // Cell View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        section = indexPath.section
        index = indexPath.row
        cellView()
        return self.cell
    }
    
    // Cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        section = indexPath.section
        index = indexPath.row
        CellSize()
        return cellSize
    }
    
    // cell margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        self.section = section
        CellMargin()
        return cellMargin
    }
     
    
}


// MARK:- ImagPicker Delegate
class IPC:UIView,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var imagpicker:() -> () = {}
    var imag = UIImage()
    var any:Any!
    
    
    func use(any:Any,imagpicker:@escaping () -> Void){
        self.any = any
        self.imagpicker = {imagpicker()}
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage{
            imag = pickedImage
            imagpicker()
        }
        (self.any as! UIViewController).dismiss(animated: true)

    }
}






















// MARK:- Core Animation
/*----------------------- Core Animation -----------------------------*/
let coreAnimation = CA.use
class CA {
    
    static let use = CA()
    
    let position = CABasicAnimation(keyPath: "position")
    let scale = CABasicAnimation(keyPath: "transform.scale")
    let rotate = CABasicAnimation(keyPath: "transform.rotation")
    let opacity = CABasicAnimation(keyPath: "opacity")

    
    
    
    /*----------- position core animation -----------*/
    
    func Position(sX:CGFloat,sY:CGFloat,eX:CGFloat,eY:CGFloat,autorerse:Bool,repeatCount:Float,duration:Double,view:UIView) {
        position.fromValue = CGPoint(x: sX, y: sY)
        position.toValue = CGPoint(x: eX, y: eY)
        position.duration = duration
        position.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        position.autoreverses = autorerse
        position.repeatCount = repeatCount
        view.layer.add(position, forKey: "position")
        //        view.layer.position = CGPoint(x: eX, y: eY)
        
    }
    
    func stopPosition(_ startingX:CGFloat,_ startingY:CGFloat,view:UIView) {
        position.repeatCount = 0
        position.duration = 0
        position.toValue = CGPoint(x: startingX, y: startingY)
        view.layer.add(position, forKey: "position")
    }
    
    
    /*------------- scale core animation -------------*/
    
    func Scale(start:CGFloat,end:CGFloat,duration:Double,repeatCount:Float,autoReverse:Bool,view:UIView) {
        scale.fromValue = start
        scale.toValue = end
        scale.duration = duration
        scale.autoreverses = autoReverse
        scale.repeatCount = repeatCount
        view.layer.add(scale, forKey: "transform.scale")
    }
    
    func stopScale(view:UIView) {
        scale.repeatCount = 0
        scale.duration = 0
        scale.toValue = 1
        view.layer.add(scale, forKey: "transform.scale")
    }
    
    
    
    /*------------- rotate core animation -------------*/
    
    func Rotate(start:CGFloat,end:CGFloat,duration:Double,autoReverses:Bool,repeatCount:Float,view:UIView) {
        rotate.fromValue = Radian(start)
        rotate.toValue = Radian(end)
        rotate.duration = duration
        rotate.autoreverses = autoReverses
        rotate.repeatCount = repeatCount
        view.layer.add(rotate, forKey: "transform.rotation")
    }
    
    func Radian(_ degree: CGFloat) -> CGFloat {
        return degree * .pi/180
    }
    
    func stopRotation(view:UIView) {
        rotate.repeatCount = 0
        rotate.duration = 0
        rotate.toValue = Radian(0)
        view.layer.add(rotate, forKey: "transform.rotation")
    }
    
    
    
    
    
    /*------------- opacity core animation -------------*/
    
    func Opacity(start:CGFloat,end:CGFloat,duration:Double,repeatCount:Float,autoreverses:Bool,view:UIView) {
        opacity.fromValue = start
        opacity.toValue = end
        opacity.duration = duration
        opacity.autoreverses = autoreverses
        opacity.repeatCount = repeatCount
        view.layer.add(opacity, forKey: "opacity")
    }
    
    func stopOpacity(view:UIView) {
        opacity.repeatCount = 0
        opacity.duration = 0
        opacity.toValue = 1
        view.layer.add(opacity, forKey: "opacity")
    }
    
    
    
    
}
