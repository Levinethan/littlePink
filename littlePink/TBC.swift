//
//  TBC.swift
//  littlePink
//
//  Created by mac on 2021/3/7.
//

import UIKit
import YPImagePicker

class TBC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is Post{
           
            var config = YPImagePickerConfiguration()
            
            // [Edit configuration here ...]
            
            config.isScrollToChangeModesEnabled = true
            config.onlySquareImagesFromCamera = true
            config.usesFrontCamera = false
            config.showsPhotoFilters = true
            config.showsVideoTrimmer = true
            config.shouldSaveNewPicturesToAlbum = true
            config.albumName = Bundle.main.appName
            
            
            config.startOnScreen = .library
            config.screens = [.library, .photo,.video]
            config.showsCrop = .none
            config.targetImageSize = YPImageSize.original
            
            //view 美颜 音乐 滤镜 todo
            //config.overlayView = UIView()

            config.preferredStatusBarStyle = UIStatusBarStyle.default
            
            config.maxCameraZoomFactor = 5.0
            

           
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kmaxNumberOfItems

            config.library.numberOfItemsInRow = 4
            config.library.spacingBetweenItems = 1.0
            
            config.gallery.hidesRemoveButton = false
    
            config.library.preselectedItems = nil
            // Build a picker with your configuration
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker]items,cancled in
                if cancled{
                    print("click cancle button")

                }
                //picker.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
            return false
        }
        return true
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
