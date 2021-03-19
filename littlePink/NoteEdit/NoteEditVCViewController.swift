//
//  NoteEditVCViewController.swift
//  littlePink
//
//  Created by mac on 2021/3/18.
//

import UIKit
import YPImagePicker
import MBProgressHUD
import SKPhotoBrowser
import AVKit
class NoteEditVCViewController: UIViewController {
    
    var photos = [UIImage(named:"1")!,UIImage(named: "2")!]
    //var videoURL: URL = Bundle.main.url(forResource: "RPReplay_Final1615046701", withExtension: "MP4")!
    var videoURL: URL?
    @IBOutlet weak var photoCollectionView: UICollectionView!
    var photoCount: Int{photos.count}
    var isVideo: Bool {videoURL != nil}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
extension NoteEditVCViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! PhotoCell
        cell.imageView.image = photos[indexPath.item]
        cell.contentView.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
//        return photoFooter
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
            
            photoFooter.addPhotoButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            return photoFooter
        default:
            fatalError("collectionView`s footer have some problem")
        }
    }
}
extension NoteEditVCViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if isVideo{
            let playerVC = AVPlayerViewController()
            playerVC.player = AVPlayer(url: videoURL!)
            present(playerVC, animated: true){
                playerVC.player?.play()
            }
        }else{
            var images : [SKPhoto] = []
            
            for photo in photos {
                images.append(SKPhoto.photoWithImage(photo))
            }

            // 2. create PhotoBrowser Instance, and present from your viewController.
            let browser = SKPhotoBrowser(photos: images, initialPageIndex: indexPath.item)
            browser.delegate = self
            SKPhotoBrowserOptions.displayAction = false
            SKPhotoBrowserOptions.displayDeleteButton = true
            present(browser, animated: true)
        }
    }
    //photo reviews

}

extension NoteEditVCViewController: SKPhotoBrowserDelegate{
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        photoCollectionView.reloadData()
        reload()
    }
}

//KVO
// MARK: - listen

extension NoteEditVCViewController{
    @objc private func addPhoto(){
        if photoCount < kmaxNumberOfItems{
            var config = YPImagePickerConfiguration()

            config.albumName = Bundle.main.appName
            config.screens = [.library]
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kmaxNumberOfItems - photoCount
            config.library.spacingBetweenItems = 1.0
            config.gallery.hidesRemoveButton = false
            // Build a picker with your configuration
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker]items,_ in
                
                for item in items {
                    if case let .photo(photo) = item{
                        self.photos.append(photo.image)
                    }
                }
                self.photoCollectionView.reloadData()
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
        }else{
            self.shouHUD("最多选择\(kmaxNumberOfItems)张照片")
        }
    }
}
