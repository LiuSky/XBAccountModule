//
//  AccountModuleApi.swift
//  XBRoute
//
//  Created by xiaobin liu on 2017/12/13.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation


/// MARK - 用户模块Api
public enum AccountModuleApi {
    
    /// 登陆接口
    case login(username: String, pwd: String)
}
