//
//  BaseViewController.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    private let navButtonWidth = 30.0
    private let edgeInset = CGFloat(10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addDoneButtonOnKeyboard( textfield : UITextField)
    {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: MAIN_SCREEN_WIDTH, height: 50))
        let doneToolbar: UIToolbar = UIToolbar(frame: rect)
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title:"Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(tapDone(sender:)))
        doneToolbar.items = [done , flexSpace]
        doneToolbar.sizeToFit()
        textfield.inputAccessoryView = doneToolbar
    }
    @objc func tapDone(sender : UIButton)
    {
        view.endEditing(true)
    }
}
