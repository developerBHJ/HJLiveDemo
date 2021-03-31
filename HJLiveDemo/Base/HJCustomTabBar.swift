//
//  HJCustomTabBar.swift
//  HJLiveDemo
//
//  Created by edz on 2021/3/30.
//  Copyright © 2021 bhj. All rights reserved.
//

import UIKit
import RxCocoa
import SnapKit

protocol HJCustomTabBarDelegate {
    
    func tabBarSelected(_ index : Int)
}

class HJCustomTabBar: UIView {
    
    /// 标签数组
    var items : [HJCustomTabBarItem] = []
    var delegate : HJCustomTabBarDelegate?
    var shaderView = UIView()
    
    /// 初始化
    /// - Parameters:
    ///   - frame: frame
    ///   - items: 标签数据数组
    init(frame: CGRect, items:[[String:AnyObject]]) {
        super.init(frame: frame)
        
        self.backgroundColor = kRGBAColor(248, 248, 248, 1.0)
        //        shaderView = UIView.init(frame: frame)
        //        shaderView.layer.shadowColor = UIColor.black.cgColor
        //        shaderView.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        //        shaderView.layer.shadowOpacity = 1.0
        //        shaderView.layer.shadowRadius = 30
        //        self.addSubview(shaderView)
        
        let itemWidth = UIScreen.main.bounds.size.width / CGFloat(items.count)
        for i in 0..<items.count {
            let itemDic = items[i]
            let itemFrame = CGRect.init(x: CGFloat(i) * itemWidth, y: 0, width: itemWidth, height: frame.size.height)
            let tabBarItem = HJCustomTabBarItem.init(frame: itemFrame, itemData: itemDic)
            self.items.append(tabBarItem)
            tabBarItem.tag = i
            tabBarItem.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
            self.addSubview(tabBarItem)
            if i == 0 {
                self.onClick(tabBarItem)
            }
        }
        
        let lineView = UIView.init()
        lineView.backgroundColor = kRGBAColor(248, 248, 248, 1.0)
        self.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// item点击事件
    /// - Parameter item: item
    @objc func onClick(_ item:HJCustomTabBarItem) {
        
        for i in 0..<items.count {
            let tabBarItem = items[i]
            if tabBarItem.tag == item.tag {
                tabBarItem.currentSelectState = true
                self.delegate?.tabBarSelected(i)
            }else{
                tabBarItem.currentSelectState = false
            }
        }
    }
}
