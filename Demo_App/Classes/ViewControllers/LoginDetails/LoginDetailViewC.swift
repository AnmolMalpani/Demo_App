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
    
    var dataStore = [[String : String]]()
    var dictLogin : HLoginModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        print(dictLogin ?? "")
        dataStore = [["Title":"User Type", "Value" : dictLogin?.user_type] ,
                     ["Title":"Teacher Name", "Value" : dictLogin?.name] ,
                     ["Title":"Class Name", "Value" : dictLogin?.class_name] ,
                     ["Title":"Section Name", "Value" : dictLogin?.section_name]
                     ] as! [[String : String]]
        setUpView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Set View
    
    private func setUpView() {
        
        registerNibFiles()
    }
    
    private func registerNibFiles() {
        
        self.loginTable?.register(nib: LoginTableViewCell.className)
    }
}
