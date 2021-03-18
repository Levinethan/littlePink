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

extension UIViewController{
    
    //加载框--手动隐藏
    
    
    
    //提示框--自动隐藏
    func shouHUD(_ title:String, _ subTitle: String? = nil){
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = title
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
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
