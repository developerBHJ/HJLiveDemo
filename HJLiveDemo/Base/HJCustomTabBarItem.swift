//
//  HJCustomTabBarItem.swift
//  HJLiveDemo
//
//  Created by edz on 2021/3/30.
//  Copyright © 2021 bhj. All rights reserved.
//

import UIKit

class HJCustomTabBarItem: UIControl {
    
    var itemDic = [String:AnyObject]()
    let titleLabel = UILabel()
    let imageView = UIImageView()
    var imageInsets = UIEdgeInsets()
    
    init(frame: CGRect, itemData:[String:AnyObject]) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        itemDic = itemData
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var currentSelectState = false{
        
        didSet{
            let imageName : String = itemDic["imageName"] as! String
            let selectedImageName = imageName + "_selected"
            imageView.image = UIImage.init(named: currentSelectState ? selectedImageName : imageName)
            let normalColor = UIColor.lightGray
            let selectedColor = UIColor.black
            titleLabel.textColor = currentSelectState ? selectedColor : normalColor
        }
    }
    
    
    private func setup() {
        
        let topSpace:CGFloat = 5.0
        let labelDefalutH : CGFloat = 20.0
        let imageWidth : CGFloat = 25.0
        let imageLeft : CGFloat = (frame.size.width - imageWidth) / 2.0
        let imageHeight : CGFloat = frame.size.height - labelDefalutH - topSpace
        imageView.frame = CGRect.init(x: imageLeft, y: 0, width: imageWidth, height: imageHeight)
        let imageName : String = itemDic["imageName"] as! String
        imageView.image = UIImage.init(named: imageName)
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.frame = CGRect.init(x: 0, y: frame.height - labelDefalutH, width: frame.size.width, height: labelDefalutH)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .lightGray
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        
        self.addSubview(imageView)
        self.addSubview(titleLabel)
    }
}
