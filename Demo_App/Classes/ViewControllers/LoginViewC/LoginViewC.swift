//
//  LoginViewC.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewC: BaseViewController {
    
    @IBOutlet weak var loginTable: UITableView?
    
    internal var loginModel : LoginModeling?
    internal var dataStore = [LoginStrct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        recheckVM()
        setUpView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Recheck VM
    
    private func recheckVM() {
        
        if self.loginModel == nil {
            
            self.loginModel = LoginVM()
        }
    }
    
    private func setUpView() {
        
        registerNibFiles()
        if let arrDataStore = self.loginModel?.prepareDataSource() {
            
            self.dataStore = arrDataStore
        }
    }
    
    private func registerNibFiles() {
        
        self.loginTable?.register(nib: LoginTableViewCell.className)
    }
    
    @IBAction func moveToLoginDetails (_ sender : UIButton) {
        
        self.view.endEditing(true)
        checkValidation()
    }
}

extension LoginViewC {
    
    private func checkValidation() {
        
        self.loginModel?.validateFields(dataStore: dataStore, validHandler: { (data, strMsg, status) in
            
            if status == true {
                self.hitLoginMethod(dataStoree: self.dataStore)
                return
            }
            HHelper.showAlert(strMsg)
        })
    }
    
    private func hitLoginMethod(dataStoree: [LoginStrct]) {
        
        let dict = ["user" : dataStoree[0].value,
                    "pass" : dataStoree[1].value ] as [String : String]
        print(dict)
        LoginDetailService().loginDetailService(dict).then { (userResponse) -> Void in
            
            print(userResponse)
            if userResponse.class_id == nil {
                
                HHelper.showAlert("Please use correct credentials")
            }
            else{
                self.moveToLoginDetail(loginModelll: userResponse)
            }
            
            }.catch { (error) in
                
                SVProgressHUD.dismiss()
                let nsError = error as NSError
                let strErrorMsg = nsError.userInfo["errorMessage"] as! String
                HHelper.showAlert(strErrorMsg)
        }
    }
    
    private func moveToLoginDetail(loginModelll : HLoginModel) {
        
        let loginDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: LoginDetailViewC.className) as! LoginDetailViewC
        loginDetailVC.dictLogin = loginModelll
        self.navigationController?.pushViewController(loginDetailVC, animated: true)
    }
}

