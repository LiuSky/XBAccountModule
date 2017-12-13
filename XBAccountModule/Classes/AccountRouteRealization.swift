//
//  AccountRouteRealization.swift
//  XBRoute
//
//  Created by xiaobin liu on 2017/12/13.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation
import UIKit
import XBRoute

//@NameSpace(AccountModule)
//

/// MARK - 用户路由实现对象
public class AccountRouteRealization: NSObject, AccountModuleRoute {
    
    
    public var accountId: String? {
        return "用户id"
    }
    
    public func showLoginVC() {
    
        let vc = UINavigationController(rootViewController: LoginVC())
        XBNavigation.present(vc)
    }
    
    public func showRetrievePasswordVC() {
        
        let vc = RetrievePasswordVC()
        XBNavigation.push(vc)
    }
}
