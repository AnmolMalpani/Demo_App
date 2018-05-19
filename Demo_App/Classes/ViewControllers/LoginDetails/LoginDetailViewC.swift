//
//  LoginDetailViewC.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import UIKit

class LoginDetailViewC: BaseViewController {
    
    @IBOutlet weak var loginTable: UITableView?
    
    internal var dataStore = [LoginStrct]()
    internal var loginDetailModel: LoginDetailModeling?
    
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
        
        if self.loginDetailModel == nil {
            
            self.loginDetailModel = LoginDetailVM()
        }
    }
    
    private func setUpView() {
        
        registerNibFiles()
        if let arrDataStore = self.loginDetailModel?.prepareDataSource() {
            
            self.dataStore = arrDataStore
        }
    }
    
    private func registerNibFiles() {
        
        self.loginTable?.register(nib: LoginTableViewCell.className)
    }
    
    @IBAction func moveToLoginDetails (_ sender : UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

