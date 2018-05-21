//
//  LoginModel.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import ObjectMapper

class HLoginModel : Mappable
{
    var id , school_id , status , class_id , section_id : Any?
    var class_teacher, user_type , class_name , name , section_name : String?
    
    required init?(map: Map) {
        
    }
    
    init(){
        
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        school_id <- map["school_id"]
        status <- map["status"]
        user_type <- map["user_type"]
        class_id <- map["class_id"]
        section_id <- map["section_id"]
        class_teacher <- map["class_teacher"]
        class_name <- map["class_name"]
        name <- map["name"]
        section_name <- map["section_name"]
    }
}

/*
 
 {
 "id": "830",
 "school_id": "1",
 "user_type": "Parent",
 "status": "1",
 "class_teacher": "",
 "class_id": "6",
 "class_name": "Class I",
 "section_id": "25",
 "section_name": "B-2018",
 "name": "Rupesh Kumar SINHA Kundu",
 "module": []
 }
 
 */
