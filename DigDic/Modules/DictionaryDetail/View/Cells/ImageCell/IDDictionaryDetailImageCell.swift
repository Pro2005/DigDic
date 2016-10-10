//
//  IDDictionaryDetailImageCell.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/4/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDDictionaryDetailImageCell: UITableViewCell, IDDictionaryDetailCell {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet weak var heightLayoutConstraint: NSLayoutConstraint!
    fileprivate var setNeedUpdateHeight = false
    
    // MARK: Public
    
    func loadWithData(_ cardData: CardData) {
        if let imageName = cardData.imageName {
            do {
                backgroundImageView.image = try IDImageManager().imageByFilename(imageName)
            } catch {
                
            }
            self.setNeedUpdateHeight = true
        }
    }
    
    // MARK: Overriden
    
    override func updateConstraints() {
        self.updateHeightIfNeeded()
        
        super.updateConstraints()
    }
    
    override func prepareForReuse() {
        self.backgroundImageView.image = nil
    }
    
    // MARK: Private
    
    fileprivate func updateHeightIfNeeded() {
        if !self.setNeedUpdateHeight {
            return
        }
        guard let image = self.backgroundImageView.image else {
            return
        }
        let imageSize = image.size
        let factor = max(imageSize.width, imageSize.height) / min(imageSize.width, imageSize.height)
        if (imageSize.width > imageSize.height) {
            self.heightLayoutConstraint.constant = ceil(self.frame.width / factor)
        } else {
            self.heightLayoutConstraint.constant = ceil(self.frame.width * factor)
        }
        self.setNeedUpdateHeight = false
    }
    
}
