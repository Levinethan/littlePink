//
//  DiscoverVC.swift
//  littlePink
//
//  Created by mac on 2021/3/5.
//

import UIKit
import XLPagerTabStrip
class DiscoverVC: ButtonBarPagerTabStripViewController,  IndicatorInfoProvider{
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title:"发现")
    }

    override func viewDidLoad() {
        settings.style.selectedBarHeight = 0
        settings.style.buttonBarItemBackgroundColor = .clear
        
        settings.style.buttonBarItemFont = .systemFont(ofSize: 13)
        
        
        super.viewDidLoad()
        containerView.bounces = false
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage:
                                            CGFloat, changeCurrentIndex: Bool, animated:Bool) -> Void in
            guard changeCurrentIndex == true else {
                return
            }
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
            
        }


        // Do any additional setup after loading the view.
    }
    
    override func viewControllers (for pagerTabStripController: PagerTabStripViewController) -> [UIViewController]{
        
        var vcs: [UIViewController] = []
        for chanel in kChannels {
            let vc = storyboard?.instantiateViewController(identifier: kWallterFallVCID) as! WallterFallVC
            vc.chanel = chanel
            vcs.append(vc)
        }
        return vcs
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
