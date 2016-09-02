//
//  IDSelectImageCell.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddWordSelectImageCell: UITableViewCell, IDAddWordCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var heightLayoutConstraint: NSLayoutConstraint!
    
    // MARK: Public
    
    func loadFromDataHolder(dataHolder: IDAddWordImageDataHolder) {
        if let image = dataHolder.image {
            self.backgroundImageView.image = image
            self.label.hidden = true
            let imageSize = image.size
            let factor = max(imageSize.width, imageSize.height) / min(imageSize.width, imageSize.height)
            if (imageSize.width > imageSize.height) {
                self.heightLayoutConstraint.constant = ceil(CGRectGetWidth(self.frame) / factor)
            } else {
                self.heightLayoutConstraint.constant = ceil(CGRectGetWidth(self.frame) * factor)
            }
        }
    }
    
    // MARK: Override
    
    override func prepareForReuse() {
        self.backgroundImageView.image = nil
        self.label.hidden = false
    }
    
}