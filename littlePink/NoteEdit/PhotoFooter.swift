//
//  PhotoFooter.swift
//  littlePink
//
//  Created by mac on 2021/3/18.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
        
    @IBOutlet weak var addPhotoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addPhotoButton.layer.borderWidth = 1
        addPhotoButton.layer.borderColor = UIColor.tertiaryLabel.cgColor
    }
}
