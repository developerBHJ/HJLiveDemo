//
//  Bundle+HJExtension.swift
//  HJLiveDemo
//
//  Created by edz on 2021/3/30.
//  Copyright © 2021 bhj. All rights reserved.
//

import UIKit

extension Bundle{
    /// 计算型属性类似于函数，没有参数，有返回值
    var nameSpace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
