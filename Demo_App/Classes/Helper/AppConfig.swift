//
//  AppConfig.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import XCGLogger

class HAppConfig: NSObject {
    
    static let _log = XCGLogger.default
    static let configPath = Bundle.main.path(forResource: "AppConfig", ofType: "plist")!
    static let config = NSDictionary(contentsOfFile: configPath)
    static let defautQ = DispatchQueue.global(qos: .default)
    static let defautMainQ = DispatchQueue.main
    static let backgrountQ = DispatchQueue.global(qos: .background)
    static let priorityQ = DispatchQueue.global(qos: .userInteractive)
    static var debugDate = Date()
    
    
    /**
     Fully qualified host name including port
     **/
    static func getServiceHostURL() -> String {
        return config!.object(forKey: "serviceHostURL") as! String
    }
    
    
    /**
     Return font size H1 FidGrit Application
     **/
    static func getFontSizeH1() -> CGFloat {
        
        return CGFloat(Float(config!.object(forKey: "fontSizeH1") as! String)!)
    }
    
    /**
     Return font size H1 FidGrit Application
     **/
//    static func getAPIKey() -> String {
//        
//        return config!.object(forKey: "APIKey") as! String
//    }
//    
}
