//
//  IDDictionaryDetailImageCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/4/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDDictionaryDetailImageCellObjectBuilder: IDDictionaryDetailCellObjectBuilder {
    
    func cellObjectForFlashcardData(flashcardData: IDFlashcardData) -> IDDictionaryDetailCell {
        let view = NSBundle.mainBundle().loadNibNamed(String(IDDictionaryDetailImageCell), owner: nil, options: nil).last
        let cell = view as! IDDictionaryDetailImageCell
//        if let imageDataHolder = dataHolder as? IDAddFlashcardImageDataHolder {
//            cell.loadFromDataHolder(imageDataHolder)
//        }
        return cell
    }
    
}
