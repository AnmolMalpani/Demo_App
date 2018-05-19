//
//  LoginVM.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Login Up Structure

struct LoginStrct {
    
    var title: String!
    var placeholder: String!
    var value: String!
    var type: LoginType!
    
    init( title: String, placeholder: String = "", value: String = "",type: LoginType) {
        
        self.title = title
        self.placeholder = placeholder
        self.value = value
        self.type = type
        
    }
    
    mutating func updateValue(inValue: String) {
        self.value = inValue
    }
}

// MARK: - Login Protocol

protocol LoginModeling {
    
    func validateFields(dataStore: [LoginStrct], validHandler: @escaping (_ param : [String : AnyObject],_ msg : String, _ success : Bool) -> Void)
    func prepareDataSource() -> [LoginStrct]
}

class LoginVM: LoginModeling
{
    // MARK: - User Defined Functions
    
    func validateFields(dataStore: [LoginStrct], validHandler: @escaping ([String : AnyObject], String, Bool) -> Void) {
        var dictParam = [String : AnyObject]()
        for index in 0..<dataStore.count {
            switch dataStore[index].type
            {
            case .Name:
                if dataStore[index].value.trimmingCharacters(in: .whitespaces) == "" {
                    validHandler([:], ConstantsTexts.userName.localizedString, false)
                    return
                }
                dictParam["name"] = dataStore[index].value.trimmingCharacters(in: .whitespaces) as AnyObject
                
            case .Password:
                if dataStore[index].value.trimmingCharacters(in: .whitespaces) == "" {
                    validHandler([:], ConstantsTexts.userPass.localizedString, false)
                    return
                }
                dictParam["pass"] = dataStore[index].value.trimmingCharacters(in: .whitespaces) as AnyObject
                
            case .some(_):
                break
            case .none:
                break
            }
        }
        validHandler(dictParam, "", true)
    }
    
    func prepareDataSource() -> [LoginStrct] {
        var dataStore = [LoginStrct]()
        dataStore.append(LoginStrct(title:ConstantsTexts.userName.localizedString , placeholder: ConstantsTexts.userNamee.localizedString, value: "", type: LoginType.Name))
        dataStore.append(LoginStrct(title:ConstantsTexts.password.localizedString , placeholder: ConstantsTexts.password.localizedString, value: "", type: LoginType.Password))
        return dataStore
    }
}
