//
//  AccountModuleRoute.swift
//  XBRoute
//
//  Created by xiaobin liu on 2017/12/13.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation

public let kAccountRoute = "AccountModuleRoute"   // or s(AccountLotus.self) 减少硬编码，使编译可以检测出 error

/// MARK - 用户模块路由协议
public protocol AccountModuleRoute  {

    /// 用户Id
    var accountId: String? { get }
    
    /// 显示登陆控制器
    func showLoginVC()
    
    /// 找回密码
    func showRetrievePasswordVC()
}
