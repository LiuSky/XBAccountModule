//
//  RouteCoordinator.swift
//  XBRoute
//
//  Created by xiaobin liu on 2017/12/13.
//  Copyright © 2017年 Sky. All rights reserved.
//

import Foundation
import UIKit

/// MARK - 路由协调类
@objc public class RouteCoordinator: NSObject {
    
    @objc public static let shared = RouteCoordinator()
    
    // lotus（协议） 和 lotusoot（实现） 表
    @objc var lotusootMap: Dictionary = Dictionary<String, Any>()
    
    @objc private override init() {
    }
    
    /// 注册 Lotus 和 Lotusoot
    ///
    /// - Parameters:
    ///   - lotusoot: lotusoot 对象。自动注册的 lotusoot 都必须是集成 NSObject，手动注册不做限制
    ///   - lotusName: lotus 协议名
    @objc public static func register(lotusoot: Any, lotusName: String) {
        shared.lotusootMap.updateValue(lotusoot, forKey: lotusName)
    }
    
    /// 通过 lotus 名称 获取 lotusoot 实例
    ///
    /// - Parameter lotus: lotus 协议名
    /// - Returns: lotusoot 对象
    @objc public static func lotusoot(lotus: String) -> Any? {
        return shared.lotusootMap[lotus]
    }
    
    /// 注册所有的 lotusoot
    ///
    /// - Parameter serviceMap: 自定义传入的字典
    @objc public static func registerAll(serviceMap: Dictionary<String, String>) {
        for (lotus, lotusootName) in serviceMap {
            let classStringName = lotusootName
            
            let classType = NSClassFromString(classStringName) as? NSObject.Type
            
            if let type = classType {
                let lotusoot = type.init()
                register(lotusoot: lotusoot, lotusName: lotus)
            }
        }
    }
    
    /// 注册所有的 lotusoot
    /// 使用默认生成的 Lotusoot.plist
    @objc public static func registerAll() {
        let lotusPlistPath = Bundle.main.path(forResource: "Lotusoot", ofType: "plist")
        if let lotusPlistPath = lotusPlistPath {
            let map = NSDictionary(contentsOfFile: lotusPlistPath)
            registerAll(serviceMap:  map as! Dictionary<String, String>)
        }
    }
}




public extension String {
    init<Subject>(_ instance: Subject) {
        self.init(describing: instance)
    }
}

/// 通过 Subject 快速获取字符串
///
/// - Parameter instance: Subject
/// - Returns: Subject 名
public func s<Subject>(_ instance: Subject) -> String {
    return String(instance)
}
