//
//  CollectionViewCell.swift
//  gallery
//
//  Created by Dieuson VIRGILE on 1/12/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var waitingBar: UIActivityIndicatorView!
    var imageUI :UIImage?
    
    func errorInLoading(errorType :String, url :String){
        DispatchQueue.main.async {
            PictureDownloadedData.errors.append((errorType, url))
            PictureDownloadedData.loadingError = true;
            PictureDownloadedData.nbLoadedPictures += 1
            self.isUserInteractionEnabled = false
        }
    }
    
    var imageUrlSource: String? {
        didSet {
            self.waitingBar.startAnimating()
            let imageUrl:URL = URL(string: self.imageUrlSource!)!
            DispatchQueue.global(qos: .utility).async {
                if let imageData:NSData = NSData(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        if let image = UIImage(data: imageData as Data) {
                            self.imageView.image = image
                            self.waitingBar.stopAnimating()
                            self.imageUI = image
                            PictureDownloadedData.nbLoadedPictures += 1
                            self.waitingBar.isHidden = true
                        } else {
                            self.errorInLoading(errorType: "Not a picture", url: self.imageUrlSource!)
                            self.waitingBar.isHidden = true
                        }
                    }
                } else {
                    self.errorInLoading(errorType: "Unreacheable page", url: self.imageUrlSource!)
                    self.waitingBar.isHidden = true
                }
            }
        }
    }
}
