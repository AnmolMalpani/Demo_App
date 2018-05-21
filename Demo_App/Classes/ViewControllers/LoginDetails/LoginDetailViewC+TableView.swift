//
//  LoginDetailViewC+TableView.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import UIKit

extension LoginDetailViewC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return getLoginInputCell(indexPath, tableView: tableView)
    }
    
    private func getLoginInputCell(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoginTableViewCell.className) as? LoginTableViewCell else {
            fatalError("Unexpected index path")
        }
        cell.userNameTF?.isHidden = true
        cell.userPassTF?.isHidden = true

        let dict = dataStore[indexPath.row]
        cell.userDtlTitleLbl?.text = dict ["Title"]
        cell.userDtlValueLbl?.text = dict ["Value"]
        cell.userDtlValueLbl?.textColor = UIColor.white
        return cell
    }
}

extension LoginDetailViewC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let logoutButtonView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 80))
        logoutButtonView.backgroundColor = UIColor.clear
        
        let logoutButton = UIButton(frame: CGRect(x: 0, y: 10, width: logoutButtonView.frame.size.width, height: 60))
        logoutButton.setTitle("LOGOUT", for: .normal)
        logoutButton.layer.cornerRadius = 3.0
        logoutButton.clipsToBounds = true
        logoutButton.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 15.0)
        logoutButton.addTarget(self, action:#selector(moveToLoginDetail(_:)), for:.touchUpInside)
        logoutButton.backgroundColor = UIColor.clear
        logoutButtonView.addSubview(logoutButton)
        
        return logoutButtonView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 70;
    }
}

extension LoginDetailViewC {
    
    @objc private func moveToLoginDetail(_ sender : UIButton) {
        
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: LoginViewC.className) as! LoginViewC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
}
