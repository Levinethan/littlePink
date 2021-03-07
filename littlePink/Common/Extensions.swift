//
//  Extensions.swift
//  littlePink
//
//  Created by mac on 2021/3/7.
//

import Foundation


extension Bundle{
    var appName: String{
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"]as? String{
             return appName
        }else{
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
}
