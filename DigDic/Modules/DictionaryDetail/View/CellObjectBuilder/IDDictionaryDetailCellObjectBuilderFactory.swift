//
//  IDDisplayDetailCellObjectBuilderFactory.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/4/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDDictionaryDetailCellObjectBuilderFactory {
    
    class func builderForFlashcardData(flashcardData: IDFlashcardData) -> IDDictionaryDetailCellObjectBuilder? {
        switch flashcardData.type! {
        case .Image:
            return IDDictionaryDetailImageCellObjectBuilder()
        default:
            return nil
        }
    }
    
}