//
//  UIViewController+TopMostViewController.swift
//  XBRoute
//
//  Created by xiaobin liu on 2017/12/13.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation
import UIKit


// MARK: - 扩展导航
public extension UIViewController {
    
    private class var sharedApplication: UIApplication? {
        let selector = NSSelectorFromString("sharedApplication")
        return UIApplication.perform(selector)?.takeUnretainedValue() as? UIApplication
    }
    
    /// Returns the current application's top most view controller.
    public class var topMost: UIViewController? {
        guard let currentWindows = self.sharedApplication?.windows else { return nil }
        var rootViewController: UIViewController?
        for window in currentWindows {
            if let windowRootViewController = window.rootViewController {
                rootViewController = windowRootViewController
                break
            }
        }
        
        return self.topMost(of: rootViewController)
    }
    
    /// Returns the top most view controller from given view controller's stack.
    public class func topMost(of viewController: UIViewController?) -> UIViewController? {
        // presented view controller
        if let presentedViewController = viewController?.presentedViewController {
            return self.topMost(of: presentedViewController)
        }
        
        // UITabBarController
        if let tabBarController = viewController as? UITabBarController,
            let selectedViewController = tabBarController.selectedViewController {
            return self.topMost(of: selectedViewController)
        }
        
        // UINavigationController
        if let navigationController = viewController as? UINavigationController,
            let visibleViewController = navigationController.visibleViewController {
            return self.topMost(of: visibleViewController)
        }
        
        // UIPageController
        if let pageViewController = viewController as? UIPageViewController,
            pageViewController.viewControllers?.count == 1 {
            return self.topMost(of: pageViewController.viewControllers?.first)
        }
        
        // child view controller
        for subview in viewController?.view?.subviews ?? [] {
            if let childViewController = subview.next as? UIViewController {
                return self.topMost(of: childViewController)
            }
        }
        
        return viewController
    }
    
    
}

/// MARK - 导航
open class XBNavigation {
    
    open class func push(_ viewController: UIViewController, animated: Bool = true) {
        guard let navigationController = UIViewController.topMost?.navigationController else {
            return
        }
        viewController.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    open class func pop(_ animated: Bool = true) {
        guard let navigationController = UIViewController.topMost?.navigationController else {
            return
        }
        navigationController.popViewController(animated: animated)
    }
    
    
    open class func present(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Swift.Void)? = nil) {
        guard let fromViewController = UIViewController.topMost else { return  }
        fromViewController.present(viewController, animated: animated, completion: completion)
    }
    
    open class func dismiss(animated: Bool = true, completion: (() -> Swift.Void)? = nil) {
        guard let fromViewController = UIViewController.topMost else { return  }
        fromViewController.view.endEditing(true)
        fromViewController.dismiss(animated: animated, completion: completion)
    }
    
    open class func showDetail(_ viewController: UIViewController, sender: Any?) {
        guard let fromViewController = UIViewController.topMost else { return  }
        fromViewController.showDetailViewController(viewController, sender: sender)
    }
    
    open class func rootViewController() -> UIViewController {
        return UIApplication.shared.keyWindow!.rootViewController!
    }
}
