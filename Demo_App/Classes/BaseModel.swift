//
//  BaseModel.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import ObjectMapper

class HBaseModel : Mappable {
    
    var status: Int?
    var time: Int64?
    var response:Any?
    var error: HErrorModel?
    
    required init?(map: Map) {
        
    }
    
    init(){
        
    }
    
    func mapping(map: Map) {
        
        status <- map["status"]
        time <- map["time"]
        response <- map["response"]
        error <- map["error"]
    }
}

class HErrorModel : Mappable {
    
    var errorCode: String?
    var message:String?
    
    required init?(map: Map) {
        
    }
    
    init(){
        
    }
    
    func mapping(map: Map) {
        errorCode <- map["errorCode"]
        message <- map["message"]
    }
}
