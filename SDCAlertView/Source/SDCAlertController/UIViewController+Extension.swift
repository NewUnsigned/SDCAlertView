//
//  UIViewController+Extension.swift
//  SDCAlertController
//
//  Created by Scott Berrevoets on 8/31/15.
//  Copyright © 2015 Scott Berrevoets. All rights reserved.
//

import UIKit

extension UIViewController {

    static func topViewController(viewController: UIViewController? = nil) -> UIViewController? {
        let viewController = viewController ?? UIApplication.sharedApplication().keyWindow?.rootViewController

        if let navigationController = viewController as? UINavigationController
            where !navigationController.viewControllers.isEmpty
        {
            return topViewController(navigationController.viewControllers.last)
        } else if let tabBarController = viewController as? UITabBarController,
            selectedController = tabBarController.selectedViewController
        {
            return topViewController(selectedController)
        } else if let presentedController = viewController?.presentedViewController {
            return topViewController(presentedController)
        }

        return viewController
    }
}
