//
//  IDAddFlashcardSelectImageCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDAddFlashcardSelectImageCellObjectBuilder: IDAddFlashcardCellObjectBuilder {
    
    func cellObjectForDataHolder(dataHolder: IDAddFlashcardDataHolder) -> IDAddFlashcardCell {
        let view = NSBundle.mainBundle().loadNibNamed(String(IDAddFlashcardSelectImageCell), owner: nil, options: nil).last
        let cell = view as! IDAddFlashcardSelectImageCell
        if let imageDataHolder = dataHolder as? IDAddFlashcardImageDataHolder {
            cell.loadFromDataHolder(imageDataHolder)
        }
        return cell
    }
    
}