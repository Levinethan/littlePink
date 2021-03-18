//
//  Extensions.swift
//  littlePink
//
//  Created by mac on 2021/3/7.
//

import UIKit


extension Bundle{
    var appName: String{
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"]as? String{
             return appName
        }else{
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
}

extension UIView{
    @IBInspectable
    var cornerRadius: CGFloat{
        get{
            layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    
}
