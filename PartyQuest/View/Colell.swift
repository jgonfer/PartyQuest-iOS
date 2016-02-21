//
//  Colell.swift
//  PartyQuest
//
//  Created by Josep Gonzalez Fernandez on 21/2/16.
//  Copyright © 2016 Josep Gonzalez Fernandez. All rights reserved.
//

import UIKit

protocol ColellDelegate {
    func isVisibleCurrentCell(indexPath: NSIndexPath) -> Bool
}

class Colell: UICollectionViewCell {
    var delegate: ColellDelegate?
    
    @IBOutlet weak var imageBg: UIImageView!
    
    func setupCell(index: NSIndexPath) {
        let imageId = kImagesCollection[index.row]
        setDefaultBg()
        
        ImageHelper.sharedInstance.imageForUrl(String(format: kImagesUrl, "\(imageId)")) { (image, url) -> () in
            guard let delegate = self.delegate else {
                return
            }
            guard let _ = image else {
                return
            }
            if delegate.isVisibleCurrentCell(index) {
                self.imageBg.image = image
                self.layoutSubviews()
                self.layoutIfNeeded()
            }
        }
    }
    
    private func setDefaultBg() {
        imageBg.image = UIImage(named: "default")
    }
}
