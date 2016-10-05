//
//  IDAddFlashcardCellObjectBuilderFactory.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddFlashcardCellObjectBuilderFactory {
    
    class func builderForDataHolder(_ dataHolder: IDAddFlashcardDataHolder) -> IDAddFlashcardCellObjectBuilder? {
        switch dataHolder {
        case _ as IDAddFlashcardImageDataHolder:
            return IDAddFlashcardSelectImageCellObjectBuilder()
        case _ as IDAddFlashcardTextDataHolder:
            return IDAddFlashcardTextCellObjectBuilder()
        default:
            return nil
        }
    }
    
    class func classNamesForRegistration() -> [String] {
        return [IDAddFlashcardSelectImageCellObjectBuilder.classNameForRegistration(), IDAddFlashcardTextCellObjectBuilder.classNameForRegistration()];
    }
    
}
