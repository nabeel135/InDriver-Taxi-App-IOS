/////////////////////////////////////
/*---- file depend on UI.swift ----*/
/////////////////////////////////////
import Foundation
import UIKit
import AVFoundation






// MARK:- TIME
/*---------------------  Time Class -------------------------*/

class time {
    /*-------------------- Time Delay -----------------------*/
    
    static func delay(sec:Int, code: @escaping () -> Void ) {
        let deadline = DispatchTime.now() + .seconds(sec)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            code()
        }
    }
    
    
    //Milli second = 1/1,000
    static func delay(milliSec:Int, code: @escaping () -> Void ) {
        let deadline = DispatchTime.now() + .milliseconds(milliSec)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            code()
        }
    }
    
    
    //Micro second = 1/1,000,000
    static func delay(microSec:Int, code: @escaping () -> Void ) {
        let deadline = DispatchTime.now() + .microseconds(microSec)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            code()
        }
    }
    
    //Nano second = 1/1,000,000,000
    static func delay(nanoSec:Int, code: @escaping () -> Void ) {
        let deadline = DispatchTime.now() + .nanoseconds(nanoSec)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            code()
        }
    }
    
    // hh:mm:ss a
    static func formate(_ formate:String) -> String {
        let obj = DateFormatter()
        obj.dateFormat = formate
        return obj.string(from: Date())
    }
}




































// MARK:- DATE
/*------------------------------ Date Class ----------------------------------*/

let date = dt()
class dt {
    
   ////////////// Feature /////////////////

    
    func marginFromYearday(day:Int,month:Int,year:Int) -> Int {
        var ret = 0
        let cday = self.monthDay()
        var cmonth = self.month()
        var cyear = self.year()
        
        
        if cyear < year {
            ret = DaysInMonth(year: cyear, month: cmonth) - cday
            cmonth+=1
            while(cmonth<=12){ret+=DaysInMonth(year: cyear, month: cmonth); cmonth+=1;}
            cyear+=1
            while(cyear<year){ret+=DaysInYear(year: cyear); cyear+=1;}
            cmonth=1
            while(cmonth<month){ret+=DaysInMonth(year: cyear, month: cmonth); cmonth+=1;}
            ret=ret+day+yearDay()
        }
        if year < cyear {
            ret=cday; cmonth-=1;
            while(cmonth>=1){ret+=DaysInMonth(year: cyear, month: cmonth); cmonth-=1;}
            cyear-=1
            while(year<cyear){ret+=DaysInYear(year: cyear); cyear-=1;}
            cmonth=12
            while(month<cmonth){ret+=DaysInMonth(year: cyear, month: cmonth); cmonth-=1;}
            ret=yearDay()-(ret+DaysInMonth(year: cyear, month: cmonth)-day)
        }
        if year == cyear {
            if(cmonth<month){
                ret=DaysInMonth(year: cyear, month: cmonth)-cday
                cmonth+=1
                while(cmonth<month){ret+=DaysInMonth(year: cyear, month: cmonth); cmonth+=1;}
                ret=ret+day+yearDay()
            }
            if(month<cmonth){
                ret=cday; cmonth-=1;
                while(month<cmonth){ret+=DaysInMonth(year: cyear, month: cmonth); cmonth-=1;}
                ret=yearDay()-(ret+DaysInMonth(year: cyear, month: cmonth)-day)
            }
            if(month==cmonth){ret=yearDay()+(day-cday)}
        }
        
        return ret
    }
    
    
    func ageCalcultor(from:Date,to:Date) -> DateComponents{
        
        // (return).year
        // (return).month
        // (return).days
        
        return Calendar.current.dateComponents([.year,.month,.day], from: from, to: to)
    }
    
    
    
    
    
    
    
    
    
    ////////////// day /////////////////
    
    func yearDay() -> Int {
        return Int(formate("DD"))!
    }
    
    func dayInYear(year:Int) -> Int {
        var ret = 365
        if isleapyear(year: year) {ret = 366}
        return ret
    }
    
    func monthDay() -> Int {
        return Int(formate("dd"))!
    }
    
    func weekDay() -> Int {
        return Calendar.current.component(.weekday, from: Date())
    }
    
    func Dayshortname(weekDay:Int) -> String {
        var ret = "nil"
        let dayname = [1:"Sun",2:"Mon",3:"Tue",4:"Wed",5:"Thu",6:"Fri",7:"Sat"]
        if weekDay>=1 && weekDay<=7 {
            ret = dayname[weekDay]!
        }
        
        return ret
    }
    
    func Daylongname(weekDay:Int) -> String {
        var ret = "nil"
        let dayname = [1:"Sunday",2:"Monday",3:"Tuesday",4:"Wednesday",5:"Thursday",6:"Friday",7:"Saturday"]
        if weekDay>=1 && weekDay<=7 {
            ret = dayname[weekDay]!
        }
        
        return ret
    }
    
    func Dayshortname() -> String {
        return formate("EE")
    }
    
    func Daylongname() -> String {
        return formate("EEEE")
    }
    
    
    func groupbyDay(indexYearday:Int,dayjump:Int) -> Int {
        var ret = monthDay()
        var cday = monthDay()
        var cmonth = month()
        var cyear = year()
        var mdays = 0
        var gap = 0
        let cyearday = indexYearday+dayjump
        
        if cyearday > yearDay() {
            gap = cyearday - yearDay()
            mdays = DaysInMonth(year: cyear, month: cmonth)-cday
            if gap<=mdays{cday+=gap;ret=cday}
            while(gap>mdays){
                gap-=mdays
                if cmonth == 12{cmonth=1;cyear+=1}
                else if cmonth>=1 && cmonth<12{cmonth+=1}
                mdays = DaysInMonth(year: cyear, month: cmonth)
                ret = gap
            }

        }
        else if cyearday < yearDay(){
            gap = yearDay() - cyearday
            mdays = monthDay()
            if gap<mdays{ret=mdays-gap}
            while(gap>=mdays){
                gap-=mdays
                if cmonth==1{cmonth=12;cyear-=1}
                else if cmonth>1 && cmonth<=12{cmonth-=1}
                mdays=DaysInMonth(year: cyear, month: cmonth)
                if gap<mdays{ret=mdays-gap}
            }
        }
        else if cyearday == yearDay() && cyear == year() {ret=cday}
        return ret
    }

    func groupbyDay_weekday(indexYearday:Int,dayjump:Int) -> Int {
        var ret = weekDay()
        var cweekday = weekDay()
        let cyear = year()
        var gap = 0
        let cyearday = indexYearday+dayjump
        
        if cyearday > yearDay() {
            gap = cyearday - yearDay()
            while(gap>0 && cweekday<7){gap-=1; cweekday+=1;}
            while(gap>0){
                if gap/7 > 0{cweekday=7; gap -= 7*(gap/7);}
                if gap%7 > 0{ cweekday=(gap%7); gap-=(gap%7); }
            }
            ret=cweekday
        }
        else if cyearday < yearDay(){
            gap = yearDay() - cyearday
            while(gap>0 && cweekday>1){gap-=1; cweekday-=1;}
            while(gap>0){
                if gap/7 > 0 {cweekday=1; gap -= 7*(gap/7);}
                if gap%7 > 0 {cweekday=8-(gap%7); gap-=(gap%7);}
            }
            ret=cweekday
        }
        else if cyearday == yearDay() && cyear == year() {ret=cweekday}
        return ret
    }
    
    func groupbyDay_Month(indexYearday:Int,dayjump:Int) -> Int {
        let cday = monthDay()
        var cmonth = month()
        var cyear = year()
        var mdays = 0
        var gap = 0
        let cyearday = indexYearday+dayjump
        
        if cyearday > yearDay() {
            gap = cyearday - yearDay()
            mdays = DaysInMonth(year: cyear, month: cmonth)-cday
            while(gap>mdays){
                gap-=mdays
                if cmonth == 12{cmonth=1;cyear+=1}
                else if cmonth>=1 && cmonth<12{cmonth+=1}
                mdays = DaysInMonth(year: cyear, month: cmonth)
            }
            
        }
        else if cyearday < yearDay(){
            gap = yearDay() - cyearday
            mdays = monthDay()
            while(gap>=mdays){
                gap-=mdays
                if cmonth==1{cmonth=12;cyear-=1}
                else if cmonth>1 && cmonth<=12{cmonth-=1}
                mdays=DaysInMonth(year: cyear, month: cmonth)
            }
        }
        return cmonth
    }
    
    func groupbyDay_Year(indexYearday:Int,dayjump:Int) -> Int {
        let cday = monthDay()
        var cmonth = month()
        var cyear = year()
        var mdays = 0
        var gap = 0
        let cyearday = indexYearday+dayjump
        
        if cyearday > yearDay() {
            gap = cyearday - yearDay()
            mdays = DaysInMonth(year: cyear, month: cmonth)-cday
            while(gap>mdays){
                gap-=mdays
                if cmonth == 12{cmonth=1;cyear+=1}
                else if cmonth>=1 && cmonth<12{cmonth+=1}
                mdays = DaysInMonth(year: cyear, month: cmonth)
            }
            
        }
        else if cyearday < yearDay(){
            gap = yearDay() - cyearday
            mdays = monthDay()
            while(gap>=mdays){
                gap-=mdays
                if cmonth==1{cmonth=12;cyear-=1}
                else if cmonth>1 && cmonth<=12{cmonth-=1}
                mdays=DaysInMonth(year: cyear, month: cmonth)
            }
        }
        return cyear
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ////////////// week ///////////////
    
    func yearWeek() -> Int {
        return Int(formate("ww"))!
    }
    
    func monthWeek() -> Int {
        return Int(formate("WW"))!
    }
    
    func groupbyWeekMin(indexYearday:Int,weekjump:Int) -> Int {
        let cweekDay = groupbyDay_weekday(indexYearday: indexYearday, dayjump: 0)
        return groupbyDay(indexYearday: indexYearday+(7*weekjump), dayjump: -(cweekDay-1))
    }
    func groupbyWeekMin_Month(indexYearday:Int,weekjump:Int) -> Int {
        let cweekDay = groupbyDay_weekday(indexYearday: indexYearday, dayjump: 0)
        return groupbyDay_Month(indexYearday: indexYearday+(7*weekjump), dayjump: -(cweekDay-1))
    }
    func groupbyWeekMin_Year(indexYearday:Int,weekjump:Int) -> Int {
        let cweekDay = groupbyDay_weekday(indexYearday: indexYearday, dayjump: 0)
        return groupbyDay_Year(indexYearday: indexYearday+(7*weekjump), dayjump: -(cweekDay-1))
    }
    
    
    
    func groupbyWeekMax(indexYearday:Int,weekjump:Int) -> Int {
        let cweekDay = groupbyDay_weekday(indexYearday: indexYearday, dayjump: 0)
        return groupbyDay(indexYearday: indexYearday+(7*weekjump), dayjump: 7-cweekDay)
    }
    func groupbyWeekMax_Month(indexYearday:Int,weekjump:Int) -> Int {
        let cweekDay = groupbyDay_weekday(indexYearday: indexYearday, dayjump: 0)
        return groupbyDay_Month(indexYearday: indexYearday+(7*weekjump), dayjump: 7-cweekDay)
    }
    func groupbyWeekMax_Year(indexYearday:Int,weekjump:Int) -> Int {
        let cweekDay = groupbyDay_weekday(indexYearday: indexYearday, dayjump: 0)
        return groupbyDay_Year(indexYearday: indexYearday+(7*weekjump), dayjump: 7-cweekDay)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ///////////// month ///////////////
    
    func month() -> Int {
        return Int(formate("MM"))!
    }
    
    func DaysInMonth(year:Int,month: Int) -> Int {
        var ret:Int = 0
        var febday = 28
        if isleapyear(year: year) {febday = 29}
        let dayinmonth = [1:31,2:febday,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31]

        if month>=1 && month<=12 {
            ret = dayinmonth[month]!
        }
        return ret
    }
    
    func monthshortname() -> String {
        let monthname = [1:"Jan",2:"Feb",3:"Mar",4:"Apr",5:"May",6:"Jun",7:"Jul",8:"Aug",9:"Sep",10:"Oct",11:"Nov",12:"Dec"]
        return monthname[month()]!
    }
    
    func monthlongname() -> String {
        return formate("MMMM")
    }
    
    func monthshortname(month:Int) -> String {
        var ret = "nil"
        let monthname = [1:"Jan",2:"Feb",3:"Mar",4:"Apr",5:"May",6:"Jun",7:"Jul",8:"Aug",9:"Sep",10:"Oct",11:"Nov",12:"Dec"]
        if month>=1 && month<=12 {
            ret = monthname[month]!
        }
        return ret
    }
    
    func monthlongname(month:Int) -> String {
        var ret = "nil"
        let monthname = [1:"January",2:"February",3:"March",4:"April",5:"May",6:"June",7:"July",8:"August",9:"September",10:"October",11:"November",12:"December"]
        if month>=1 && month<=12 {
            ret = monthname[month]!
        }
        return ret
    }
    
    func groupbyMonth(indexMonth:Int,indexYear:Int,monthjump:Int) -> Int {
        var ret = 0
        var cmonth = indexMonth
        var cyear = indexYear
        var gap = monthjump
        
        if gap>0 {
            if gap > (12-cmonth) {
                gap-=(12-cmonth)
                cmonth=12
                
                if gap/12 > 0 {cyear+=(gap/12);gap-=12*(gap/12);}
                if gap%12 > 0 {cyear+=1;cmonth=(gap%12);}
            }
            else{cmonth+=gap}
        }
        
        if gap<0 {
            gap=(-gap)
            if gap > (cmonth-1){
                gap-=(cmonth-1)
                cmonth=1
                
                if gap/12 > 0 {cyear-=(gap/12);gap-=12*(gap/12);}
                if gap%12 > 0 {cyear-=1;cmonth=13-(gap%12)}
            }
            else{cmonth-=gap}
        }
        ret=cmonth

        return ret
    }
    
    func groupbyMonth_year(indexMonth:Int,indexYear:Int,monthjump:Int) -> Int {
        var ret = 0
        var cmonth = indexMonth
        var cyear = indexYear
        var gap = monthjump
        
        if gap>0 {
            if gap > (12-cmonth) {
                gap-=(12-cmonth)
                cmonth=12
                
                if gap/12 > 0 {cyear+=(gap/12);gap-=12*(gap/12);}
                if gap%12 > 0 {cyear+=1;cmonth=(gap%12);}
            }
        }
        if gap<0 {
            gap=(-gap)
            if gap > (cmonth-1){
                gap-=(cmonth-1)
                cmonth=1
                
                if gap/12 > 0 {cyear-=(gap/12);gap-=12*(gap/12);}
                if gap%12 > 0 {cyear-=1;cmonth=12-(gap%12)}
            }
        }
        
        ret=cyear
        return ret
    }
    
    
    
    
    
    
    
    
    
    
    
    /////////////////// year //////////////////
    
    func year() -> Int {
        return Int(formate("YYYY"))!
    }
    
    func isleapyear(year:Int) -> Bool {
        var ret = false
        if year%4 == 0 {
            ret = true
        }
        return ret
    }
    
    func DaysInYear(year:Int) -> Int{
        var ret = 365
        if year%4 == 0 {ret=366}
        return ret
    }
    
    
    
    
    
    
    
    
    
    public enum dateFormate{
           case dayNameFull,dayNameShort,month,monthDay,monthNameFull,monthWeek,year,yearDay,yearWeek,month_day_Year,day_month_Year
       }
    
    func StringtoDate(day:Int,month:Int,year:Int)->Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.date(from: "\(year)/\(month)/\(day)") ?? Date()
    }
    
    func formate(_ formate:String) -> String {
        let obj = DateFormatter()
        obj.dateFormat = formate
        return obj.string(from: Date())
    }
    func formate(_ dateFormate:dateFormate) -> String{
        switch dateFormate {
        case .dayNameFull: return formate("EEEE")
        case .dayNameShort: return formate("EE")
        case .month: return formate("MM")
        case .monthDay: return formate("dd")
        case .monthNameFull: return formate("MMMM")
        case .monthWeek: return formate("WW")
        case .year: return formate("YYYY")
        case .yearDay: return formate("DD")
        case .yearWeek: return formate("ww")
        case .month_day_Year: return formate("MM,dd YYYY")
        case .day_month_Year: return formate("dd,MM YYYY")
        }
    }
    
    
    
    
    
    
    
    
    
    
}
















// MARK:- Functions
/*----------------------- Angle convertion (Degree to Radian) --------------------*/

func Radian(_ degree: CGFloat) -> CGFloat {
    return degree * .pi/180
}



/*---------------------- address of any object --------------------*/

func addressOF<T: AnyObject>(_ anyObject: T) -> Int {
    return unsafeBitCast(anyObject, to: Int.self)
}


/*---------------------- add child view --------------------*/
func addchildview(parent:UIViewController,child:UIViewController,view:UIView) {
    parent.addChild(child)
    view.addSubview(child.view)
}


/*------------- Storyboard access with coding ----------------*/
func storyboardView(boardName:String,pageID:String) -> UIViewController {
    return         UIStoryboard(name: boardName, bundle: nil).instantiateViewController(identifier: pageID)
}

func nibView(fileName:String,ownerClass:Any) -> UIView{
    
    return Bundle.main.loadNibNamed(fileName, owner: ownerClass, options: nil)![0] as! UIView
}



extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}



// MARK:- SceneDelegate

extension SceneDelegate {
    func root(_ scene:UIScene,_ VC:UIViewController) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = VC
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

/////////////////////////////////////////////////////////////////////////////////
// MARK:- User Default

func save(value:Bool,key:String){
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}
func save(value:String,key:String){
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}
func getBool(key:String)->Bool{
    return UserDefaults.standard.bool(forKey: key)
}

func getString(key:String)->String{
    return UserDefaults.standard.string(forKey: key) ?? ""
}


//////////////////////////////////////////////////////////////////
// MARK:-  Audio

public enum soundID{
    case Lock,PINKeyPressed,KeyPressed1,KeyPressed2,KeyPressed3,Null
}

func playSystemSound(_ soundType:soundID){
    
    switch soundType {
    case .Lock: AudioServicesPlaySystemSound(SystemSoundID(1305))
    case .PINKeyPressed: AudioServicesPlaySystemSound(SystemSoundID(1057))
    case .KeyPressed1: AudioServicesPlaySystemSound(SystemSoundID(1103))
    case .KeyPressed2: AudioServicesPlaySystemSound(SystemSoundID(1104))
    case .KeyPressed3: AudioServicesPlaySystemSound(SystemSoundID(1105))
    case .Null:break
    }
}



// MARK:- Extension String

extension String {
    var stringWidth: CGFloat {
        let constraintRect = CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude)
        let boundingBox = self.trimmingCharacters(in: .whitespacesAndNewlines).boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return boundingBox.width
    }
    

    var stringHeight: CGFloat {
        let constraintRect = CGSize(width: UIScreen.main.bounds.width, height: .greatestFiniteMagnitude)
        let boundingBox = self.trimmingCharacters(in: .whitespacesAndNewlines).boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return boundingBox.height
    }
    
    func toInt() -> Int{
        return Int(self) ?? Int()
    }
    
    func toDouble() -> Double{
        return Double(self) ?? Double()
    }
    
    func toUIImage() -> UIImage{
        if (self.isEmpty) {
          return UIImage()
      }else {
          // !!! Separation part is optional, depends on your Base64String !!!
          let temp = self.components(separatedBy: ",")
        let dataDecoded : Data = Data(base64Encoded: temp[1], options: .ignoreUnknownCharacters)!
          return UIImage(data: dataDecoded)!
      }
    }
    
}


// MARK:- Extension Int

extension Int {
    func tostring() -> String{
        return String(self)
    }
}

// MARK:- Extension Double

extension Double{
    func tostring() -> String{
        return String(self)
    }
}







// MARK:- ScrollView Gesture Recognizer

let ScrollviewGestureRecognizer = SVGR.use
class SVGR:UIView {
    static let use = SVGR()
    func pan(_ any:Any,_ panfunction:Selector) -> UIPanGestureRecognizer{
        let pan = UIPanGestureRecognizer(target: any, action: panfunction)
        pan.delegate = self
        return pan
    }
    
    func tap(_ any:Any,_ tapfunction:Selector) -> UITapGestureRecognizer{
        let tap = UITapGestureRecognizer(target: any, action: tapfunction)
        tap.delegate = self
        return tap
    }
}
extension SVGR: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}











