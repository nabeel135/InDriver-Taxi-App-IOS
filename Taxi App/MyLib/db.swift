//
//  db.swift
//  QMe
//
//  Created by Mr. Nabeel on 2/13/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON




// MARK:- APIs

let db = dbclass()
class dbclass {
    

    
    
    var json = JSON()
    var err = String()
    func jsonResponse(url:URLConvertible,method:HTTPMethod,parameters:Parameters,headers:HTTPHeaders,onStart:@escaping ()-> Void,onSuccess:@escaping ()-> Void,onFailure:@escaping ()-> Void){
        Alamofire.request(url,
                          method: method,
                          parameters: parameters,
                          headers: headers).responseData { response in
                            switch response.result {
                            case .success(let data):
                                db.json = JSON(data)
                                onSuccess()
                            case .failure(let err):
                                db.err = err.localizedDescription
                                onFailure()
                                
                            }
        }
    }
    
    
    
    
    func googleTranslator(label:UILabel,from:LanguageCode,to:LanguageCode,googleAPIkey:String){
        SwiftGoogleTranslate.shared.start(with: googleAPIkey)
        SwiftGoogleTranslate.shared.translate(label.text!,
                                              languageCode(to),
                                              languageCode(from))
        { (text, error) in
            if text != nil {DispatchQueue.main.async {label.text = text}}
        }
    }
    
    func googleTranslator(button:UIButton,from:LanguageCode,to:LanguageCode,googleAPIkey:String){
        SwiftGoogleTranslate.shared.start(with: googleAPIkey)
        SwiftGoogleTranslate.shared.translate(button.titleLabel!.text!,
                                              languageCode(to),
                                              languageCode(from))
        { (text, error) in
            if text != nil {DispatchQueue.main.async {button.setTitle(text, for: .normal)}}
        }
    }
    
    
}




// MARK:- Language, Country, Flag, Code
func languageCode(_ lang:LanguageCode) -> String{
    switch lang {
    case .Afrikaans: return "af"
    case .Albanian: return "sq"
    case .Arabic: return "ar"
    case .Armenian: return "hy"
    case .Azerbaijani: return "az"
    case .Bengali: return "bn"
    case .Bihari: return "bh"
    case .Bosnian: return "bs"
    case .Chinese: return "zh-Hans"
    case .Danish: return "da"
    case .Maldivian: return "dv"
    case .Dutch: return "nl"
    case .English: return "en"
    case .Fijian: return "fj"
    case .French: return "fr"
    case .Georgian: return "ka"
    case .German: return "de"
    case .Greek: return "el"
    case .Greenlandic: return "kl"
    case .Gujarati: return "gu"
    case .Hindi: return "hi"
    case .Hungarian: return "hu"
    case .Icelandic: return "is"
    case .Indonesian: return "id"
    case .Irish: return "ga"
    case .Italian: return "it"
    case .Japanese: return "ja"
    case .Kannada: return "kn"
    case .Kashmiri: return "ks"
    case .Korean: return "ko"
    case .Latin: return "la"
    case .Malay: return "ms"
    case .Malayalam: return "ml"
    case .Maltese: return "mt"
    case .Marathi: return "mr"
    case .Mongolian: return "mn"
    case .Nepali: return "ne"
    case .Persian_Farsi: return "fa"
    case .Polish: return "pl"
    case .Portuguese: return "pt"
    case .Punjabi: return "pa"
    case .Romanian: return "ro"
    case .Russian: return "ru"
    case .Sanskrit: return "sa"
    case .Serbian: return "sr"
    case .Sindhi: return "sd"
    case .Spanish: return "es"
    case .Swedish: return "sv"
    case .Tamil: return "ta"
    case .Telugu: return "te"
    case .Thai: return "th"
    case .Turkish: return "tr"
    case .Turkmen: return "tk"
    case .Ukrainian: return "uk"
    case .Urdu: return "ur"
    case .Filipino: return "fil"
    case .Vietnamese: return "vi"
    }
}

public enum LanguageCode{
    case Afrikaans ,Albanian   ,Arabic   ,Armenian   ,Azerbaijani   ,Bengali   ,Bihari   ,Bosnian   ,Chinese   ,Danish ,Maldivian   ,Dutch   ,English   ,Fijian   ,French   ,Georgian   ,German   ,Greek   ,Greenlandic   ,Gujarati   ,Hindi   ,Hungarian   ,Icelandic   ,Indonesian   ,Irish   ,Italian   ,Japanese   ,Kannada   ,Kashmiri   ,Korean   ,Latin   ,Malay   ,Malayalam   ,Maltese   ,Marathi   ,Mongolian   ,Nepali   ,Persian_Farsi   ,Polish   ,Portuguese   ,Punjabi   ,Romanian   ,Russian   ,Sanskrit   ,Serbian   ,Sindhi   ,Spanish   ,Swedish   ,Tamil   ,Telugu   ,Thai  ,Turkish   ,Turkmen   ,Ukrainian   ,Urdu  ,Filipino ,Vietnamese
}
let LanguageName = LN()
public class LN{
    let Afrikaans = "Afrikaans",Albanian = "Albanian",Arabic = "Arabic",Armenian = "Armenian",Azerbaijani = "Azerbaijani",Bengali = "Bengali",Bihari = "Bihari",Bosnian = "Bosnian",Chinese = "Chinese",Danish = "Danish",Maldivian = "Maldivian",Dutch = "Dutch",English = "English",Fijian = "Fijian",French = "French",Georgian = "Georgian",German = "German",Greek = "Greek",Greenlandic = "Greenlandic",Gujarati = "Gujarati",Hindi = "Hindi",Hungarian = "Hungarian",Icelandic = "Icelandic",Indonesian = "Indonesian",Irish = "Irish",Italian = "Italian",Japanese = "Japanese",Kannada = "Kannada",Kashmiri = "Kashmiri",Korean = "Korean",Latin = "Latin",Malay = "Malay",Malayalam = "Malayalam",Maltese = "Maltese",Marathi = "Marathi",Mongolian = "Mongolian",Nepali = "Nepali",Persian_Farsi = "Persian Farsi",Polish = "Polish",Portuguese = "Portuguese",Punjabi = "Punjabi",Romanian = "Romanian",Russian = "Russian",Sanskrit = "Sanskrit",Serbian = "Serbian",Sindhi = "Sindhi",Spanish = "Spanish",Swedish = "Swedish",Tamil = "Tamil",Telugu = "Telugu",Thai = "Turkish",Turkish = "Turkish",Turkmen = "Turkmen",Ukrainian = "Ukrainian",Urdu = "Urdu",Filipino = "Filipino",Vietnamese = "Vietnamese"
    
}

let phoneCode = ["AF", "AX", "AL", "DZ", "AS", "AD", "AO", "AI", "AQ", "AG", "AR", "AM", "AW", "AU", "AT", "AZ", "BS", "BH", "BD", "BB", "BY", "BE", "BZ", "BJ", "BM", "BT", "BO", "BQ", "BA", "BW", "BV", "BR", "IO", "UM", "VG", "VI", "BN", "BG", "BF", "BI", "KH", "CM", "CA", "CV", "KY", "CF", "TD", "CL", "CN", "CX", "CC", "CO", "KM", "CG", "CD", "CK", "CR", "HR", "CU", "CW", "CY", "CZ", "DK", "DJ", "DM", "DO", "EC", "EG", "SV", "GQ", "ER", "EE", "ET", "FK", "FO", "FJ", "FI", "FR", "GF", "PF", "TF", "GA", "GM", "GE", "DE", "GH", "GI", "GR", "GL", "GD", "GP", "GU", "GT", "GG", "GN", "GW", "GY", "HT", "HM", "VA", "HN", "HK", "HU", "IS", "IN", "ID", "CI", "IR", "IQ", "IE", "IM", "IL", "IT", "JM", "JP", "JE", "JO", "KZ", "KE", "KI", "KW", "KG", "LA", "LV", "LB", "LS", "LR", "LY", "LI", "LT", "LU", "MO", "MK", "MG", "MW", "MY", "MV", "ML", "MT", "MH", "MQ", "MR", "MU", "YT", "MX", "FM", "MD", "MC", "MN", "ME", "MS", "MA", "MZ", "MM", "NA", "NR", "NP", "NL", "NC", "NZ", "NI", "NE", "NG", "NU", "NF", "KP", "MP", "NO", "OM", "PK", "PW", "PS", "PA", "PG", "PY", "PE", "PH", "PN", "PL", "PT", "PR", "QA", "XK", "RE", "RO", "RU", "RW", "BL", "SH", "KN", "LC", "MF", "PM", "VC", "WS", "SM", "ST", "SA", "SN", "RS", "SC", "SL", "SG", "SX", "SK", "SI", "SB", "SO", "ZA", "GS", "KR", "SS", "ES", "LK", "SD", "SR", "SJ", "SZ", "SE", "CH", "SY", "TW", "TJ", "TZ", "TH", "TL", "TG", "TK", "TO", "TT", "TN", "TR", "TM", "TC", "TV", "UG", "UA", "AE", "GB", "US", "UY", "UZ", "VU", "VE", "VN", "WF", "EH", "YE", "ZM", "ZW"]
let countryName = ["Afghanistan", "Åland Islands", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "The Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bonaire", "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "United States Minor Outlying Islands", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Republic of the Congo", "Democratic Republic of the Congo", "Cook Islands", "Costa Rica", "Croatia", "Cuba", "Curaçao", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern and Antarctic Lands", "Gabon", "The Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Holy See", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Ivory Coast", "Iran", "Iraq", "Republic of Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Republic of Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Federated States of Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "North Korea", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn Islands", "Poland", "Portugal", "Puerto Rico", "Qatar", "Republic of Kosovo", "Réunion", "Romania", "Russia", "Rwanda", "Saint Barthélemy", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Martin", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "São Tomé and Príncipe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Sint Maarten", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia", "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard and Jan Mayen", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "East Timor", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Wallis and Futuna", "Western Sahara", "Yemen", "Zambia", "Zimbabwe"]
let countryCode = ["93", "358", "355", "213", "1684", "376", "244", "1264", "", "1268", "54", "374", "297", "61", "43", "994", "1242", "973", "880", "1246", "375", "32", "501", "229", "1441", "975", "591", "5997", "387", "267", "", "55", "246", "", "1284", "1 340", "673", "359", "226", "257", "855", "237", "1", "238", "1345", "236", "235", "56", "86", "61", "61", "57", "269", "242", "243", "682", "506", "385", "53", "599", "357", "420", "45", "253", "1767", "1809", "593", "20", "503", "240", "291", "372", "251", "500", "298", "679", "358", "33", "594", "689", "", "241", "220", "995", "49", "233", "350", "30", "299", "1473", "590", "1671", "502", "44", "224", "245", "592", "509", "", "379", "504", "852", "36", "354", "91", "62", "225", "98", "964", "353", "44", "972", "39", "1876", "81", "44", "962", "76", "254", "686", "965", "996", "856", "371", "961", "266", "231", "218", "423", "370", "352", "853", "389", "261", "265", "60", "960", "223", "356", "692", "596", "222", "230", "262", "52", "691", "373", "377", "976", "382", "1664", "212", "258", "95", "264", "674", "977", "31", "687", "64", "505", "227", "234", "683", "672", "850", "1670", "47", "968", "92", "680", "970", "507", "675", "595", "51", "63", "64", "48", "351", "1787", "974", "383", "262", "40", "7", "250", "590", "290", "1869", "1758", "590", "508", "1784", "685", "378", "239", "966", "221", "381", "248", "232", "65", "1721", "421", "386", "677", "252", "27", "500", "82", "211", "34", "94", "249", "597", "4779", "268", "46", "41", "963", "886", "992", "255", "66", "670", "228", "690", "676", "1868", "216", "90", "993", "1649", "688", "256", "380", "971", "44", "1", "598", "998", "678", "58", "84", "681", "212", "967", "260", "263"]
let countryFlagURL = ["https://www.countryflags.io/AF/flat/32.png", "https://www.countryflags.io/AX/flat/32.png", "https://www.countryflags.io/AL/flat/32.png", "https://www.countryflags.io/DZ/flat/32.png", "https://www.countryflags.io/AS/flat/32.png", "https://www.countryflags.io/AD/flat/32.png", "https://www.countryflags.io/AO/flat/32.png", "https://www.countryflags.io/AI/flat/32.png", "https://www.countryflags.io/AQ/flat/32.png", "https://www.countryflags.io/AG/flat/32.png", "https://www.countryflags.io/AR/flat/32.png", "https://www.countryflags.io/AM/flat/32.png", "https://www.countryflags.io/AW/flat/32.png", "https://www.countryflags.io/AU/flat/32.png", "https://www.countryflags.io/AT/flat/32.png", "https://www.countryflags.io/AZ/flat/32.png", "https://www.countryflags.io/BS/flat/32.png", "https://www.countryflags.io/BH/flat/32.png", "https://www.countryflags.io/BD/flat/32.png", "https://www.countryflags.io/BB/flat/32.png", "https://www.countryflags.io/BY/flat/32.png", "https://www.countryflags.io/BE/flat/32.png", "https://www.countryflags.io/BZ/flat/32.png", "https://www.countryflags.io/BJ/flat/32.png", "https://www.countryflags.io/BM/flat/32.png", "https://www.countryflags.io/BT/flat/32.png", "https://www.countryflags.io/BO/flat/32.png", "https://www.countryflags.io/BQ/flat/32.png", "https://www.countryflags.io/BA/flat/32.png", "https://www.countryflags.io/BW/flat/32.png", "https://www.countryflags.io/BV/flat/32.png", "https://www.countryflags.io/BR/flat/32.png", "https://www.countryflags.io/IO/flat/32.png", "https://www.countryflags.io/UM/flat/32.png", "https://www.countryflags.io/VG/flat/32.png", "https://www.countryflags.io/VI/flat/32.png", "https://www.countryflags.io/BN/flat/32.png", "https://www.countryflags.io/BG/flat/32.png", "https://www.countryflags.io/BF/flat/32.png", "https://www.countryflags.io/BI/flat/32.png", "https://www.countryflags.io/KH/flat/32.png", "https://www.countryflags.io/CM/flat/32.png", "https://www.countryflags.io/CA/flat/32.png", "https://www.countryflags.io/CV/flat/32.png", "https://www.countryflags.io/KY/flat/32.png", "https://www.countryflags.io/CF/flat/32.png", "https://www.countryflags.io/TD/flat/32.png", "https://www.countryflags.io/CL/flat/32.png", "https://www.countryflags.io/CN/flat/32.png", "https://www.countryflags.io/CX/flat/32.png", "https://www.countryflags.io/CC/flat/32.png", "https://www.countryflags.io/CO/flat/32.png", "https://www.countryflags.io/KM/flat/32.png", "https://www.countryflags.io/CG/flat/32.png", "https://www.countryflags.io/CD/flat/32.png", "https://www.countryflags.io/CK/flat/32.png", "https://www.countryflags.io/CR/flat/32.png", "https://www.countryflags.io/HR/flat/32.png", "https://www.countryflags.io/CU/flat/32.png", "https://www.countryflags.io/CW/flat/32.png", "https://www.countryflags.io/CY/flat/32.png", "https://www.countryflags.io/CZ/flat/32.png", "https://www.countryflags.io/DK/flat/32.png", "https://www.countryflags.io/DJ/flat/32.png", "https://www.countryflags.io/DM/flat/32.png", "https://www.countryflags.io/DO/flat/32.png", "https://www.countryflags.io/EC/flat/32.png", "https://www.countryflags.io/EG/flat/32.png", "https://www.countryflags.io/SV/flat/32.png", "https://www.countryflags.io/GQ/flat/32.png", "https://www.countryflags.io/ER/flat/32.png", "https://www.countryflags.io/EE/flat/32.png", "https://www.countryflags.io/ET/flat/32.png", "https://www.countryflags.io/FK/flat/32.png", "https://www.countryflags.io/FO/flat/32.png", "https://www.countryflags.io/FJ/flat/32.png", "https://www.countryflags.io/FI/flat/32.png", "https://www.countryflags.io/FR/flat/32.png", "https://www.countryflags.io/GF/flat/32.png", "https://www.countryflags.io/PF/flat/32.png", "https://www.countryflags.io/TF/flat/32.png", "https://www.countryflags.io/GA/flat/32.png", "https://www.countryflags.io/GM/flat/32.png", "https://www.countryflags.io/GE/flat/32.png", "https://www.countryflags.io/DE/flat/32.png", "https://www.countryflags.io/GH/flat/32.png", "https://www.countryflags.io/GI/flat/32.png", "https://www.countryflags.io/GR/flat/32.png", "https://www.countryflags.io/GL/flat/32.png", "https://www.countryflags.io/GD/flat/32.png", "https://www.countryflags.io/GP/flat/32.png", "https://www.countryflags.io/GU/flat/32.png", "https://www.countryflags.io/GT/flat/32.png", "https://www.countryflags.io/GG/flat/32.png", "https://www.countryflags.io/GN/flat/32.png", "https://www.countryflags.io/GW/flat/32.png", "https://www.countryflags.io/GY/flat/32.png", "https://www.countryflags.io/HT/flat/32.png", "https://www.countryflags.io/HM/flat/32.png", "https://www.countryflags.io/VA/flat/32.png", "https://www.countryflags.io/HN/flat/32.png", "https://www.countryflags.io/HK/flat/32.png", "https://www.countryflags.io/HU/flat/32.png", "https://www.countryflags.io/IS/flat/32.png", "https://www.countryflags.io/IN/flat/32.png", "https://www.countryflags.io/ID/flat/32.png", "https://www.countryflags.io/CI/flat/32.png", "https://www.countryflags.io/IR/flat/32.png", "https://www.countryflags.io/IQ/flat/32.png", "https://www.countryflags.io/IE/flat/32.png", "https://www.countryflags.io/IM/flat/32.png", "https://www.countryflags.io/IL/flat/32.png", "https://www.countryflags.io/IT/flat/32.png", "https://www.countryflags.io/JM/flat/32.png", "https://www.countryflags.io/JP/flat/32.png", "https://www.countryflags.io/JE/flat/32.png", "https://www.countryflags.io/JO/flat/32.png", "https://www.countryflags.io/KZ/flat/32.png", "https://www.countryflags.io/KE/flat/32.png", "https://www.countryflags.io/KI/flat/32.png", "https://www.countryflags.io/KW/flat/32.png", "https://www.countryflags.io/KG/flat/32.png", "https://www.countryflags.io/LA/flat/32.png", "https://www.countryflags.io/LV/flat/32.png", "https://www.countryflags.io/LB/flat/32.png", "https://www.countryflags.io/LS/flat/32.png", "https://www.countryflags.io/LR/flat/32.png", "https://www.countryflags.io/LY/flat/32.png", "https://www.countryflags.io/LI/flat/32.png", "https://www.countryflags.io/LT/flat/32.png", "https://www.countryflags.io/LU/flat/32.png", "https://www.countryflags.io/MO/flat/32.png", "https://www.countryflags.io/MK/flat/32.png", "https://www.countryflags.io/MG/flat/32.png", "https://www.countryflags.io/MW/flat/32.png", "https://www.countryflags.io/MY/flat/32.png", "https://www.countryflags.io/MV/flat/32.png", "https://www.countryflags.io/ML/flat/32.png", "https://www.countryflags.io/MT/flat/32.png", "https://www.countryflags.io/MH/flat/32.png", "https://www.countryflags.io/MQ/flat/32.png", "https://www.countryflags.io/MR/flat/32.png", "https://www.countryflags.io/MU/flat/32.png", "https://www.countryflags.io/YT/flat/32.png", "https://www.countryflags.io/MX/flat/32.png", "https://www.countryflags.io/FM/flat/32.png", "https://www.countryflags.io/MD/flat/32.png", "https://www.countryflags.io/MC/flat/32.png", "https://www.countryflags.io/MN/flat/32.png", "https://www.countryflags.io/ME/flat/32.png", "https://www.countryflags.io/MS/flat/32.png", "https://www.countryflags.io/MA/flat/32.png", "https://www.countryflags.io/MZ/flat/32.png", "https://www.countryflags.io/MM/flat/32.png", "https://www.countryflags.io/NA/flat/32.png", "https://www.countryflags.io/NR/flat/32.png", "https://www.countryflags.io/NP/flat/32.png", "https://www.countryflags.io/NL/flat/32.png", "https://www.countryflags.io/NC/flat/32.png", "https://www.countryflags.io/NZ/flat/32.png", "https://www.countryflags.io/NI/flat/32.png", "https://www.countryflags.io/NE/flat/32.png", "https://www.countryflags.io/NG/flat/32.png", "https://www.countryflags.io/NU/flat/32.png", "https://www.countryflags.io/NF/flat/32.png", "https://www.countryflags.io/KP/flat/32.png", "https://www.countryflags.io/MP/flat/32.png", "https://www.countryflags.io/NO/flat/32.png", "https://www.countryflags.io/OM/flat/32.png", "https://www.countryflags.io/PK/flat/32.png", "https://www.countryflags.io/PW/flat/32.png", "https://www.countryflags.io/PS/flat/32.png", "https://www.countryflags.io/PA/flat/32.png", "https://www.countryflags.io/PG/flat/32.png", "https://www.countryflags.io/PY/flat/32.png", "https://www.countryflags.io/PE/flat/32.png", "https://www.countryflags.io/PH/flat/32.png", "https://www.countryflags.io/PN/flat/32.png", "https://www.countryflags.io/PL/flat/32.png", "https://www.countryflags.io/PT/flat/32.png", "https://www.countryflags.io/PR/flat/32.png", "https://www.countryflags.io/QA/flat/32.png", "https://www.countryflags.io/XK/flat/32.png", "https://www.countryflags.io/RE/flat/32.png", "https://www.countryflags.io/RO/flat/32.png", "https://www.countryflags.io/RU/flat/32.png", "https://www.countryflags.io/RW/flat/32.png", "https://www.countryflags.io/BL/flat/32.png", "https://www.countryflags.io/SH/flat/32.png", "https://www.countryflags.io/KN/flat/32.png", "https://www.countryflags.io/LC/flat/32.png", "https://www.countryflags.io/MF/flat/32.png", "https://www.countryflags.io/PM/flat/32.png", "https://www.countryflags.io/VC/flat/32.png", "https://www.countryflags.io/WS/flat/32.png", "https://www.countryflags.io/SM/flat/32.png", "https://www.countryflags.io/ST/flat/32.png", "https://www.countryflags.io/SA/flat/32.png", "https://www.countryflags.io/SN/flat/32.png", "https://www.countryflags.io/RS/flat/32.png", "https://www.countryflags.io/SC/flat/32.png", "https://www.countryflags.io/SL/flat/32.png", "https://www.countryflags.io/SG/flat/32.png", "https://www.countryflags.io/SX/flat/32.png", "https://www.countryflags.io/SK/flat/32.png", "https://www.countryflags.io/SI/flat/32.png", "https://www.countryflags.io/SB/flat/32.png", "https://www.countryflags.io/SO/flat/32.png", "https://www.countryflags.io/ZA/flat/32.png", "https://www.countryflags.io/GS/flat/32.png", "https://www.countryflags.io/KR/flat/32.png", "https://www.countryflags.io/SS/flat/32.png", "https://www.countryflags.io/ES/flat/32.png", "https://www.countryflags.io/LK/flat/32.png", "https://www.countryflags.io/SD/flat/32.png", "https://www.countryflags.io/SR/flat/32.png", "https://www.countryflags.io/SJ/flat/32.png", "https://www.countryflags.io/SZ/flat/32.png", "https://www.countryflags.io/SE/flat/32.png", "https://www.countryflags.io/CH/flat/32.png", "https://www.countryflags.io/SY/flat/32.png", "https://www.countryflags.io/TW/flat/32.png", "https://www.countryflags.io/TJ/flat/32.png", "https://www.countryflags.io/TZ/flat/32.png", "https://www.countryflags.io/TH/flat/32.png", "https://www.countryflags.io/TL/flat/32.png", "https://www.countryflags.io/TG/flat/32.png", "https://www.countryflags.io/TK/flat/32.png", "https://www.countryflags.io/TO/flat/32.png", "https://www.countryflags.io/TT/flat/32.png", "https://www.countryflags.io/TN/flat/32.png", "https://www.countryflags.io/TR/flat/32.png", "https://www.countryflags.io/TM/flat/32.png", "https://www.countryflags.io/TC/flat/32.png", "https://www.countryflags.io/TV/flat/32.png", "https://www.countryflags.io/UG/flat/32.png", "https://www.countryflags.io/UA/flat/32.png", "https://www.countryflags.io/AE/flat/32.png", "https://www.countryflags.io/GB/flat/32.png", "https://www.countryflags.io/US/flat/32.png", "https://www.countryflags.io/UY/flat/32.png", "https://www.countryflags.io/UZ/flat/32.png", "https://www.countryflags.io/VU/flat/32.png", "https://www.countryflags.io/VE/flat/32.png", "https://www.countryflags.io/VN/flat/32.png", "https://www.countryflags.io/WF/flat/32.png", "https://www.countryflags.io/EH/flat/32.png", "https://www.countryflags.io/YE/flat/32.png", "https://www.countryflags.io/ZM/flat/32.png", "https://www.countryflags.io/ZW/flat/32.png"]





// MARK:- Google Translator
/// A helper class for using Google Translate API.
public class SwiftGoogleTranslate {
    
    /// Shared instance.
    public static let shared = SwiftGoogleTranslate()

    /// Language response structure.
    public struct Language {
        public let language: String
        public let name: String
    }
    
    /// Detect response structure.
    public struct Detection {
        public let language: String
        public let isReliable: Bool
        public let confidence: Float
    }
    
    /// API structure.
    private struct API {
        /// Base Google Translation API url.
        static let base = "https://translation.googleapis.com/language/translate/v2"
        
        /// A translate endpoint.
        struct translate {
            static let method = "POST"
            static let url = API.base
        }
        
        /// A detect endpoint.
        struct detect {
            static let method = "POST"
            static let url = API.base + "/detect"
        }
        
        /// A list of languages endpoint.
        struct languages {
            static let method = "GET"
            static let url = API.base + "/languages"
        }
    }
    
    /// API key.
    private var apiKey: String!
    /// Default URL session.
    private let session = URLSession(configuration: .default)
    
    /**
        Initialization.
    
        - Parameters:
            - apiKey: A valid API key to handle requests for this API. If you are using OAuth 2.0 service account credentials (recommended), do not supply this parameter.
    */
    public func start(with apiKey: String) {
        self.apiKey = apiKey
    }
    
    /**
        Translates input text, returning translated text.
    
        - Parameters:
            - q: The input text to translate. Repeat this parameter to perform translation operations on multiple text inputs.
            - target: The language to use for translation of the input text.
            - format: The format of the source text, in either HTML (default) or plain-text. A value of html indicates HTML and a value of text indicates plain-text.
            - source: The language of the source text. If the source language is not specified, the API will attempt to detect the source language automatically and return it within the response.
            - model: The translation model. Can be either base to use the Phrase-Based Machine Translation (PBMT) model, or nmt to use the Neural Machine Translation (NMT) model. If omitted, then nmt is used. If the model is nmt, and the requested language translation pair is not supported for the NMT model, then the request is translated using the base model.
    */
    public func translate(_ q: String, _ target: String, _ source: String, _ format: String = "text", _ model: String = "base", _ completion: @escaping ((_ text: String?, _ error: Error?) -> Void)) {
        guard var urlComponents = URLComponents(string: API.translate.url) else {
            completion(nil, nil)
            return
        }
        
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "key", value: apiKey))
        queryItems.append(URLQueryItem(name: "q", value: q))
        queryItems.append(URLQueryItem(name: "target", value: target))
        queryItems.append(URLQueryItem(name: "source", value: source))
        queryItems.append(URLQueryItem(name: "format", value: format))
        queryItems.append(URLQueryItem(name: "model", value: model))
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            completion(nil, nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = API.translate.method
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data,                                // is there data
                let response = response as? HTTPURLResponse,    // is there HTTP response
                (200 ..< 300) ~= response.statusCode,            // is statusCode 2XX
                error == nil else {                                // was there no error, otherwise ...
                    completion(nil, error)
                    return
            }
            
            guard let object = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any], let d = object["data"] as? [String: Any], let translations = d["translations"] as? [[String: String]], let translation = translations.first, let translatedText = translation["translatedText"] else {
                completion(nil, error)
                return
            }
            
            completion(translatedText, nil)
        }
        task.resume()
    }
    
    /**
        Detects the language of text within a request.
    
        - Parameters:
            - q: The input text upon which to perform language detection. Repeat this parameter to perform language detection on multiple text inputs.
    */
    public func detect(_ q: String, _ completion: @escaping ((_ languages: [Detection]?, _ error: Error?) -> Void)) {
        guard var urlComponents = URLComponents(string: API.detect.url) else {
            completion(nil, nil)
            return
        }
        
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "key", value: apiKey))
        queryItems.append(URLQueryItem(name: "q", value: q))
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            completion(nil, nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = API.detect.method
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data,                                // is there data
                let response = response as? HTTPURLResponse,    // is there HTTP response
                (200 ..< 300) ~= response.statusCode,            // is statusCode 2XX
                error == nil else {                                // was there no error, otherwise ...
                    completion(nil, error)
                    return
            }
            
            guard let object = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any], let d = object["data"] as? [String: Any], let detections = d["detections"] as? [[[String: Any]]] else {
                completion(nil, error)
                return
            }
            
            var result = [Detection]()
            for languageDetections in detections {
                for detection in languageDetections {
                    if let language = detection["language"] as? String, let isReliable = detection["isReliable"] as? Bool, let confidence = detection["confidence"] as? Float {
                        result.append(Detection(language: language, isReliable: isReliable, confidence: confidence))
                    }
                }
            }
            completion(result, nil)
        }
        task.resume()
    }
    
    /**
        Returns a list of supported languages for translation.
    
        - Parameters:
            - target: The target language code for the results. If specified, then the language names are returned in the name field of the response, localized in the target language. If you do not supply a target language, then the name field is omitted from the response and only the language codes are returned.
            - model: The translation model of the supported languages. Can be either base to return languages supported by the Phrase-Based Machine Translation (PBMT) model, or nmt to return languages supported by the Neural Machine Translation (NMT) model. If omitted, then all supported languages are returned. Languages supported by the NMT model can only be translated to or from English (en).
            - completion: A completion closure with an array of Language structures and an error if there is.
    */
    public func languages(_ target: String = "en", _ model: String = "base", _ completion: @escaping ((_ languages: [Language]?, _ error: Error?) -> Void)) {
        guard var urlComponents = URLComponents(string: API.languages.url) else {
            completion(nil, nil)
            return
        }
        
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "key", value: apiKey))
        queryItems.append(URLQueryItem(name: "target", value: target))
        queryItems.append(URLQueryItem(name: "model", value: model))
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            completion(nil, nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = API.languages.method
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data,                                // is there data
                let response = response as? HTTPURLResponse,    // is there HTTP response
                (200 ..< 300) ~= response.statusCode,            // is statusCode 2XX
                error == nil else {                                // was there no error, otherwise ...
                completion(nil, error)
                return
            }
            
            guard let object = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any], let d = object["data"] as? [String: Any], let languages = d["languages"] as? [[String: String]] else {
                completion(nil, error)
                return
            }
            
            var result = [Language]()
            for language in languages {
                if let code = language["language"], let name = language["name"] {
                    result.append(Language(language: code, name: name))
                }
            }
            completion(result, nil)
        }
        task.resume()
    }
    
}






