//
//  HHelper.swift
//  Demo_App
//
//  Created by Anmol's Macbook Air on 19/05/18.
//  Copyright © 2018 Anmol Maheshwari. All rights reserved.
//

import Foundation
import UIKit

class HHelper {
    
    // MARK: - Get root view controller
    
    class func rootViewController() -> UIViewController
    {
        return (UIApplication.shared.keyWindow?.rootViewController)!
    }
    
    // MARK: - Get topmost view controller
    
    class func topMostViewController(rootViewController: UIViewController) -> UIViewController?
    {
        if let navigationController = rootViewController as? UINavigationController
        {
            return topMostViewController(rootViewController: navigationController.visibleViewController!)
        }
        
        if let tabBarController = rootViewController as? UITabBarController
        {
            if let selectedTabBarController = tabBarController.selectedViewController
            {
                return topMostViewController(rootViewController: selectedTabBarController)
            }
        }
        
        if let presentedViewController = rootViewController.presentedViewController
        {
            return topMostViewController(rootViewController: presentedViewController)
        }
        return rootViewController
    }

    // MARK: Alert methods
    
    class func showAlert(_ message: String, okButtonTitle: String? = nil, target: UIViewController? = nil) {
        
        let topViewController: UIViewController? = HHelper.topMostViewController(rootViewController: HHelper.rootViewController())
        
        if let _ = topViewController {
            let alert = UIAlertController(title:APP_NAME, message: message, preferredStyle: UIAlertControllerStyle.alert);
            let okBtnTitle = "OK"
            let okAction = UIAlertAction(title:okBtnTitle, style: UIAlertActionStyle.default, handler: nil);
            
            alert.addAction(okAction);
            if UIApplication.shared.applicationState != .background{
                topViewController?.present(alert, animated:true, completion:nil);
            }
        }
    }
    
    class func getIndexPathFor(view: UIView, tableView: UITableView) -> IndexPath? {
        let point = tableView.convert(view.bounds.origin, from: view)
        let indexPath = tableView.indexPathForRow(at: point)
        return indexPath
    }
    
    class func getIndexPathFor(view: UIView, collectionView: UICollectionView) -> IndexPath? {
        let point = collectionView.convert(view.bounds.origin, from: view)
        let indexPath = collectionView.indexPathForItem(at: point)
        return indexPath
    }
}
