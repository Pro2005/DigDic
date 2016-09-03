//
//  IDAddFlashcardCellObjectBuilderFactory.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDAddFlashcardCellObjectBuilderFactory {
    
    class func builderForDataHolder(dataHolder: IDAddFlashcardDataHolder) -> IDAddFlashcardCellObjectBuilder? {
        switch dataHolder {
        case _ as IDAddFlashcardImageDataHolder:
            return IDAddFlashcardSelectImageCellObjectBuilder()
        default:
            return nil
        }
    }
    
}