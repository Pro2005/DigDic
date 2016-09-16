//
//  IDSelectImageCell.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddFlashcardSelectImageCell: UITableViewCell, IDAddFlashcardCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var heightLayoutConstraint: NSLayoutConstraint!
    private var setNeedUpdateHeight = false
    
    // MARK: Public
    
    override func updateConstraints() {
        self.updateHeightIfNeeded()
        
        super.updateConstraints()
    }
    
    func loadFromDataHolder(dataHolder: IDAddFlashcardDataHolder) {
        guard let dataHolder = dataHolder as? IDAddFlashcardImageDataHolder else {
            return
        }
        if let image = dataHolder.image {
            self.backgroundImageView.image = image
            self.label.hidden = true
            self.setNeedUpdateHeight = true
        }
    }
    
    // MARK: Override
    
    override func prepareForReuse() {
        self.backgroundImageView.image = nil
        self.label.hidden = false
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