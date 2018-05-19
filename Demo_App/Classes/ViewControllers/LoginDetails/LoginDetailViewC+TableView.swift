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
        cell.userDtlValueLbl?.isHidden = true
        cell.configureCellWith(info: dataStore[indexPath.row])
        return cell
    }
}

// MARK: - Text Field Delegate

extension LoginDetailViewC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let currentIndexPath = HHelper.getIndexPathFor(view: textField, tableView: self.loginTable!) else {
            return true
        }
        let lastRowIndex = (self.loginTable?.numberOfRows(inSection: 0))! - 1
        
        if currentIndexPath.row != lastRowIndex {
            
            var nextIndexPath = IndexPath(row: currentIndexPath.row + 1, section: 0)
            
            while nextIndexPath.row <= lastRowIndex {
                if let nextCell = self.loginTable?.cellForRow(at: nextIndexPath) as? LoginTableViewCell {
                    self.loginTable?.scrollToRow(at: nextIndexPath, at: .middle, animated: true)
                    nextCell.userNameTF?.returnKeyType = .next
                    if nextIndexPath.row == lastRowIndex {
                        nextCell.userNameTF?.returnKeyType = .done
                    }
                    nextCell.userPassTF?.becomeFirstResponder()
                    break
                }
            }
            textField.resignFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        let str = textField.text as String?
        if let index = HHelper.getIndexPathFor(view: textField, tableView: self.loginTable!) {
            
            if str?.count == 0 {
                
                self.dataStore[index.row].value = ""
            }
            else{
                self.dataStore[index.row].value = str
            }
        }
    }
}
