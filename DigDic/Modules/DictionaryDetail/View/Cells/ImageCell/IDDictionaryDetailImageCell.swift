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
    private var setNeedUpdateHeight = false
    
    // MARK: Public
    
    func loadWithData(cardData: IDCardData) {
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
    
    private func updateHeightIfNeeded() {
        if !self.setNeedUpdateHeight {
            return
        }
        guard let image = self.backgroundImageView.image else {
            return
        }
        let imageSize = image.size
        let factor = max(imageSize.width, imageSize.height) / min(imageSize.width, imageSize.height)
        if (imageSize.width > imageSize.height) {
            self.heightLayoutConstraint.constant = ceil(CGRectGetWidth(self.frame) / factor)
        } else {
            self.heightLayoutConstraint.constant = ceil(CGRectGetWidth(self.frame) * factor)
        }
        self.setNeedUpdateHeight = false
    }
    
}