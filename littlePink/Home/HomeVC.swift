//
//  HomeVC.swift
//  littlePink
//
//  Created by mac on 2021/3/5.
//

import UIKit
import XLPagerTabStrip
class HomeVC:  ButtonBarPagerTabStripViewController{

    override func viewDidLoad() {
        
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        
        settings.style.buttonBarItemBackgroundColor = .clear
       
        settings.style.buttonBarItemFont = .systemFont(ofSize: 15)
        settings.style.buttonBarItemLeftRightMargin = 0
        
        
        
        
        
        
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
    
//    override func calculateStretchedCellWidth (_ minimumCellWidths: [CGFloat], suggestedStreTchedCellWidth: CGFloat, priviousNumberOfLargeCells :Int) -> CGFloat{
//        20
//    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let follow = storyboard!.instantiateViewController(identifier: kFollowID)
        let nearBy = storyboard!.instantiateViewController(identifier: kNearbyID)
        let discover = storyboard!.instantiateViewController(identifier: kDiscover)
        
        return [discover,follow,nearBy]
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
