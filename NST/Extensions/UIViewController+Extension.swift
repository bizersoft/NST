//
//  UIViewController+Extension.swift
//  NST
//
//  Created by TIAN TONG on 10/6/20.
//

import UIKit

extension UIViewController {
    
    struct Screen {
        static var hasNotch: Bool {
            UIWindow(frame: UIScreen.main.bounds).safeAreaInsets.top > 20
        }
    }
    
    var naviGap: CGFloat {
        Screen.hasNotch ? 88.0 : 64.0
    }
    
    var bottomGap: CGFloat {
        Screen.hasNotch ? 34.0 : 0.0
    }
    
    func topViewController() -> UIViewController? {
        if let navigationController = self as? UINavigationController {
            return navigationController.visibleViewController
        }
        
        if let tabBarController = self as? UITabBarController {
            if let seleted = tabBarController.selectedViewController {
                return seleted.topViewController()
            }
        }
        
        if let presentedViewController = self.presentedViewController {
            return presentedViewController.topViewController()
        }
        
        return self
    }
    
}
