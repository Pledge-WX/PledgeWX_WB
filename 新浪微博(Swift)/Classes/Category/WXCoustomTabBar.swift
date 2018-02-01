//
//  WXCoustomTabBar.swift
//  新浪微博(Swift)
//
//  Created by 王旭 on 2018/2/1.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit

class WXCoustomTabBar: UITabBar {
    override init(frame: CGRect) {//纯代码走这个方法
        super.init(frame: frame)
        addSubview(composeButton)
    }
    required init?(coder aDecoder: NSCoder) {//通过sb/xib创建的View控件走此构造方法
        super.init(coder: aDecoder)
        addSubview(composeButton)
    }
    override func layoutSubviews() {//重新设置tabbar的frame
        super.layoutSubviews()
        let buttonW = self.bounds.size.width/5
        let buttonH = self.bounds.size.height
        let rect = CGRect(x: 0, y: 0, width: buttonW, height: buttonH)
        var viewIndex:CGFloat = 0
        for tabView in subviews {//遍历所有子视图获取到UITabBarButton
            if tabView.isKind(of: NSClassFromString("UITabBarButton")!){
                tabView.frame = rect.offsetBy(dx: viewIndex * buttonW, dy: 0)
                //预留位置给composeButton：三目运算符考虑优先级：+=优先级较低
                viewIndex += viewIndex == 1 ? 2 : 1
            }
        }
        composeButton.frame = rect.offsetBy(dx: 2 * buttonW, dy: 0)
        //前置控件
        bringSubview(toFront: composeButton)
    }
    //初始化中间加号按钮
    lazy var composeButton:UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: .normal)
        button.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: .highlighted)
        button.setImage(UIImage(named:"tabbar_compose_icon_add"), for: .normal)
        button.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: .highlighted)
        button.sizeToFit()
        return button
    }()
}
