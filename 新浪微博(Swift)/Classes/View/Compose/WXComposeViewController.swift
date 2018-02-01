//
//  WXComposeViewController.swift
//  新浪微博(Swift)
//
//  Created by 王旭 on 2018/2/1.
//  Copyright © 2018年 PledgeWX. All rights reserved.
//

import UIKit
import SnapKit
class WXComposeViewController: WXBeaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createDissmissTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    @objc func dissmissButtonClick(){
        dismiss(animated: true, completion: nil)
    }
}
extension WXComposeViewController{
    fileprivate func createDissmissTabBar(){
        let tabBarView:UIView = UIView()
        view.addSubview(tabBarView)
        tabBarView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view.bounds.size.width)
            make.bottom.equalTo(0)
            make.height.equalTo(44)
        }
        let bgImageView:UIImageView = UIImageView()
        bgImageView.image = UIImage(named:"tabbar_background")
        tabBarView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
           make.edges.equalToSuperview()
        }
        let dissmissButton:UIButton = UIButton()
        dissmissButton.set(image: nil, title: "关闭", titleFont: WXFontConstant.boldFont14, titleColor: UIColor.mainColor, backgroundColor: .clear, cornerRadiusValue: 0, titlePosition:.scaleToFill, additionalSpacing: 0, state: .normal)
        dissmissButton.addTarget(self, action: #selector(self.dissmissButtonClick), for: .touchUpInside)
        tabBarView.addSubview(dissmissButton)
        dissmissButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
}
