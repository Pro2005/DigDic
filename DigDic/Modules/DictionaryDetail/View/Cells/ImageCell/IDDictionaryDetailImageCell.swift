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
    
    func loadWithData(flashcardDataImage: IDFlashcardDataImage) {
        backgroundImageView.image = IDImageManager().imageByFilename(flashcardDataImage.name!)
    }
    
}