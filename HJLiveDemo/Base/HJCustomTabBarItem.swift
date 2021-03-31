//
//  HJCustomTabBarItem.swift
//  HJLiveDemo
//
//  Created by edz on 2021/3/30.
//  Copyright © 2021 bhj. All rights reserved.
//

import UIKit

class HJCustomTabBarItem: UIControl {
    
    var itemDic = [String:String]()
    let titleLabel = UILabel()
    let imageView = UIImageView()
    var imageInsets = UIEdgeInsets()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        let topSpace = 5.0
        let labelDefalutH = 20.0
        
        
    }
}
