//
//  LoginVC.swift
//  XBRoute
//
//  Created by xiaobin liu on 2017/12/13.
//  Copyright © 2017年 Sky. All rights reserved.
//

import UIKit

/// MARK - 用户登陆控制器
public class LoginVC: UIViewController {

    private lazy var logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"))
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "登陆"
        self.view.backgroundColor = .white
        logoImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoImageView.center = self.view.center
        self.view.addSubview(logoImageView)
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
