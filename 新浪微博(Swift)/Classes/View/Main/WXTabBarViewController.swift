//
//  WXTabBarViewController.swift
//  新浪微博(Swift)
//
//  Created by 王旭 on 2018/2/1.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

class WXTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let coustomTabBar = WXCoustomTabBar()
        setValue(coustomTabBar, forKey: "tabBar")
        addChildViewController()
        //给mainTabBar添加点击事件
        coustomTabBar.composeButton.addTarget(self, action: #selector(self.composeDidClick), for: .touchUpInside)
    }
    @objc func composeDidClick (){//中间加号按钮的点击事件
        let composeVc = WXComposeViewController()
        composeVc.modalPresentationStyle = .overCurrentContext
        let nav = WXNavViewController(rootViewController: composeVc)
        present(nav, animated: true) {
            UIView.animate(withDuration: 0.38, animations: {
                composeVc.view.backgroundColor = UIColor.init(red: 240, green: 240, blue: 240, alpha: 0.8)
            })
        }
    }
}
extension WXTabBarViewController{
    fileprivate func addChildViewController(){
        addChildViewController(WXHomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(WXMessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(WXDiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(WXProfileViewController(), title: "我的", imageName: "tabbar_profile")
    }
    fileprivate func addChildViewController(_ childVc: UIViewController, title : String, imageName : String) {
        childVc.title = title;
        childVc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName),
                                          selectedImage: UIImage(named: imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal))
        childVc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.normalTextColor], for: .selected)
        //2.包装导航控制器
        let childNav = WXNavViewController(rootViewController: childVc)
        //3.添加控制器
        addChildViewController(childNav)
    }
    }
