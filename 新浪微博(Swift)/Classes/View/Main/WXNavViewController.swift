//
//  WXNavViewController.swift
//  新浪微博(Swift)
//
//  Created by 王旭 on 2018/2/1.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

class WXNavViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor.mainColor
        navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font: WXFontConstant.boldFont15]
    }
    override func pushViewController(_ viewController:UIViewController, animated:Bool) {
        viewController.navigationItem.hidesBackButton=true
        if childViewControllers.count>0{
            UINavigationBar.appearance().backItem?.hidesBackButton=false
            let backButton = UIButton(type: .custom)
            backButton.setImage(#imageLiteral(resourceName: "tableview_loading"), for: .normal)
            backButton.addTarget(self, action: #selector(backButtonClick), for: .touchUpInside)
            let backView = UIBarButtonItem(customView: backButton)
            viewController.navigationItem.leftBarButtonItem = backView
            viewController.hidesBottomBarWhenPushed=true
        }
        super.pushViewController(viewController, animated: animated)
    }
    @objc func backButtonClick(){
        popViewController(animated: true)
        print("返回了")
    }
}
