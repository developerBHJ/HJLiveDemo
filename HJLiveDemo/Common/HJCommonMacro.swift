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
let kNavigationBarHeight = kStatusBarHeight ?? 20 + 44
/// 底部安全距离高度
let kSafeBottomHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom
/// TabBar高度
let kTabBarHeight = kSafeBottomHeight ?? 0 + 48


/// 16进制颜色
/// - Parameter colorString: 16进制字符串
/// - Returns: 颜色
func colorWithHex(_ colorString: String) -> UIColor{
    
    
    return UIColor.init()
}
