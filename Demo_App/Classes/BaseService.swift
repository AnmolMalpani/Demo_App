//
//  BaseService.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import XCGLogger

class HBaseService {
    
    let _log = HAppConfig._log
    func reqHeader () -> HTTPHeaders {
        let parameters:HTTPHeaders = [
            "requestinghostname": UIDevice.current.name,
            ];
        return parameters
    }
    
    func getServiceHostURL() -> String {
        return HAppConfig.getServiceHostURL()
    }
}



