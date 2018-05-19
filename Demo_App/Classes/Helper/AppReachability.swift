//
//  AppReachability.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import Reachability

class AppReachability: NSObject{
    
    //declare this property where it won't go out of scope relative to your listener
    let reachability = Reachability()!
    
    var isReachAble:Bool = true;
    
    
    // MARK: - Singleton Instance
    
    class var sharedInstance: AppReachability{
        
        struct Static{
            
            static let instance = AppReachability()
        }
        return Static.instance
    }
    
    func startMoniteringReachability() -> Void
    {
        //declare this inside of viewWillAppear
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(_:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    @objc func reachabilityChanged(_ note: Notification)
    {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
            isReachAble = true
        case .cellular:
            print("Reachable via Cellular")
            isReachAble = true
        case .none:
            print("Network not reachable")
            isReachAble = false
        }
    }
}
