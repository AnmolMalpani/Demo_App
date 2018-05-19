//
//  LoginPostService.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import PromiseKit
import SwiftyJSON

class LoginDetailService : HBaseService {

    //End Point
    let loginDetailEndPoint: String = "teacher_login.php"
    
    //MARK:- POST api response for Login
    
    func loginDetailService(_ dict:[String: String]) -> Promise<HLoginModel> {
        
        return Promise { fullfill, reject in
            
            if AppReachability.sharedInstance.isReachAble == false{
                reject(NSError(domain: "HUserService",code:1000,userInfo: ["errorMessage":ConstantsTexts.noInterNet]))
                return
            }
            
            let completeUrl = self.getServiceHostURL() + loginDetailEndPoint
            self._log.debug("API:\(completeUrl) Param \(dict)")
            
            Alamofire.request(completeUrl, method: .post, parameters: ["pass":"12345","user":"mamta"],encoding: JSONEncoding.default, headers: nil).responseJSON (queue: nil, options: JSONSerialization.ReadingOptions.allowFragments,completionHandler: { response in
                
                switch response.result {
                    
                case .success(let value):
                    
                    if let jsonString = JSON(value).rawString(),
                        let responseModel = Mapper<HBaseModel>().map(JSONString: jsonString),
                        let responseError = responseModel.error {
                        
                        reject(NSError(domain: "HUserService",code:1000,userInfo: ["errorMessage":responseError.message!]))
                    }
                    else if let jsonDict = JSON(value).dictionaryObject {
                        
                        let loginResponseModel = Mapper<HLoginModel>().map(JSONObject: jsonDict)
                        
                        self._log.debug("response :\(jsonDict)")
                        fullfill(loginResponseModel!)
                    }
                    else{
                        reject(NSError(domain: "HUserService",code:1000,userInfo: ["errorMessage":"request time out"]))
                    }
                    break;
                case .failure(let error):
                    self._log.debug("\(error) and error code is \(error)")
                    reject(NSError(domain: "HUserService",code:1000,userInfo: ["errorMessage":"request time out"]))
                    break;
                }
            }) //End of alamofire
        }
    }
}
