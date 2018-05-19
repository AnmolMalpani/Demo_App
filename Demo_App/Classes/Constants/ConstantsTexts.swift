//
//  ConstantsTexts.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation


enum ConstantsTexts : String {
    
    case appName = "Demo App"
    case userName = "Please Enter User Name"
    case userPass = "Please Enter Password"
    case noInterNet = "No internet"
    
    case userNamee                       =  "USERNAME"
    case password                       =  "PASSWORD"
    
    var localizedString : String {
        
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
