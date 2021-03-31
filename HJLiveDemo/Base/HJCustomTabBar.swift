//
//  HJCustomTabBar.swift
//  HJLiveDemo
//
//  Created by edz on 2021/3/30.
//  Copyright © 2021 bhj. All rights reserved.
//

import UIKit

class HJCustomTabBar: UIView {
    
    /// 标签数组
    var items : [HJCustomTabBarItem] = []
    
    
    /// 初始化
    /// - Parameters:
    ///   - frame: frame
    ///   - items: 标签数据数组
    init(frame: CGRect, items:[[String:String]]) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        let itemWidth = UIScreen.main.bounds.size.width / CGFloat(items.count)
        for i in 0..<items.count {
            let itemDic = items[i]
            let itemFrame = CGRect.init(x: CGFloat(i) * itemWidth, y: 0, width: itemWidth, height: frame.size.height)
            let tabBarItem = HJCustomTabBarItem.init()
            
            
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
