//
//  NoteEditVCViewController.swift
//  littlePink
//
//  Created by mac on 2021/3/18.
//

import UIKit
import YPImagePicker

class NoteEditVCViewController: UIViewController {
    
    var photos = [UIImage(named:"1")]
    @IBOutlet weak var photoCollectionView: UICollectionView!
    var photoCount: Int{photos.count}
    
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
                
                //picker.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
        }else{
            
        }
    }
}
