//
//  LoginTableViewCell.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import UIKit

class LoginTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameTF: UITextField?
    @IBOutlet weak var userPassTF: UITextField?
    @IBOutlet weak var userDtlTitleLbl: UILabel?
    @IBOutlet weak var userDtlValueLbl: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - User Define Function
    public func configureCellWith(info: LoginStrct) {
        
        userDtlTitleLbl?.text = info.placeholder
    }
}
