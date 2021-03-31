//
//  HJMainTabBarController.swift
//  HJLiveDemo
//
//  Created by edz on 2021/3/30.
//  Copyright © 2021 bhj. All rights reserved.
//

import UIKit

class HJMainTabBarController: UITabBarController {
    
    var customTabBar : HJCustomTabBar!
    var tabBarData : [[String:AnyObject]] = []
    override func viewDidLoad() {
        
        delegate = self
        initCustomTabBar()
        addChildrenControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    /// 自定义导航栏
    func initCustomTabBar() {
        //        let tabBarFrame = self.tabBar.frame
        self.tabBar.isHidden = true
        let documentDic = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (documentDic as NSString).appendingPathComponent("Main.json")
        var data = NSData(contentsOfFile: jsonPath)
        if data == nil {
            let path = Bundle.main.path(forResource: "Main.json", ofType: nil)
            data = NSData(contentsOfFile: path ?? "")
        }
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments) as? [[String:AnyObject]] else {
            print("main.json don't exist.")
            return
        }
        tabBarData = array
        customTabBar = HJCustomTabBar.init(frame: CGRect.init(x: 0, y: kScreenH - kTabBarHeight, width: kScreenW, height: kTabBarHeight), items: tabBarData)
        customTabBar.delegate = self
        self.view.addSubview(customTabBar)
    }
}

extension HJMainTabBarController{
    
    /// 添加子控制器
    private func addChildrenControllers(){
        
        var modules = [UIViewController]()
        for dic in tabBarData {
            modules.append(initChildController(dic: dic))
        }
        viewControllers = modules
    }
    
    /// 初始化子控制器
    /// - Parameter dic: 数据
    /// - Returns: 控制器
    private func initChildController(dic: [String: Any]) -> UIViewController{
        
        guard let clsName = dic["clsName"] as? String,
            let title = dic["title"] as? String,
            let imageName = dic["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type
            else{
                return UIViewController()
        }
        /// create view controller ==> clsname -> class
        let vc = cls.init()
        vc.title = title
        
        /// set icon image
        let normalImage = imageName
        let selectedImage = imageName + "_selected"
        vc.tabBarItem.image = UIImage(named: normalImage)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        //        vc.tabBarItem.imageInsets = UIEdgeInsets.init(top: 5, left: 0, bottom: 0, right: 0)
        
        /// swift5: set UIBarItem title color
        let attributes = [
            NSAttributedString.Key.foregroundColor : UIColor.lightGray,
            NSAttributedString.Key.backgroundColor : UIColor.lightGray,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)
        ]
        vc.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        
        let attributes2 = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.backgroundColor : UIColor.black,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)
        ]
        vc.tabBarItem.setTitleTextAttributes(attributes2, for: .selected)
        let navi = HJBaseNavigationController(rootViewController: vc)
        return navi
    }
}

extension HJMainTabBarController:UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        return !viewController.isMember(of: UIViewController.self)
    }
}

extension HJMainTabBarController : HJCustomTabBarDelegate{
    
    func tabBarSelected(_ index: Int) {
        guard let vc = self.viewControllers?[index] else {
            return
        }
        self.selectedIndex = index
        self.selectedViewController = vc
    }
}
