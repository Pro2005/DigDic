//
//  IDAddWordCellObjectBuilderFactory.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDAddWordCellObjectBuilderFactory {
    
    class func builderForDataHolder(dataHolder: IDAddWordDataHolder) -> IDAddWordCellObjectBuilder? {
        switch dataHolder {
        case _ as IDAddWordImageDataHolder:
            return IDAddWordSelectImageCellObjectBuilder()
        default:
            return nil
        }
    }
    
}