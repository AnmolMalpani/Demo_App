//
//  NSObjectExtensions.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var className: String {
        
        return String(describing: self)
    }
}
