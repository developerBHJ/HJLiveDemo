//
//  HJCommonMacro.swift
//  HJLiveDemo
//
//  Created by edz on 2021/3/31.
//  Copyright © 2021 bhj. All rights reserved.
//

import UIKit

/// 屏幕宽
let kScreenW = UIScreen.main.bounds.size.width
/// 屏幕高
let kScreenH = UIScreen.main.bounds.size.height
/// 状态栏高度
let kStatusBarHeight = UIApplication.shared.windows.first?.safeAreaInsets.top
/// 导航栏高度
let kNavigationBarHeight = (kStatusBarHeight ?? 20) + 44
/// 底部安全距离高度
let kSafeBottomHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom
/// TabBar高度
let kTabBarHeight = (kSafeBottomHeight ?? 0) + 48

let kColor3 = UIColor.init(red: 51, green: 51, blue: 51, alpha: 1.0)
let kColor6 = UIColor.init(red: 102, green: 102, blue: 102, alpha: 1.0)
let kColor9 = UIColor.init(red: 153, green: 153, blue: 153, alpha: 1.0)

/// 16进制颜色
/// - Parameter colorString: 16进制字符串
/// - Returns: 颜色
func colorWithHex(_ colorString: String) -> UIColor{
    
    
    return UIColor.init()
}

/// RGBA
/// - Parameters:
///   - r: r description
///   - g: g description
///   - b: b description
///   - a: a description
/// - Returns: 颜色
func kRGBAColor(_ r : CGFloat,_ g : CGFloat,_ b : CGFloat,_ a : CGFloat) -> UIColor {
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

