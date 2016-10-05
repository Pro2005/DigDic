//
//  IDDictionariesListCellObjectBuilderFactory.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/10/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDDictionariesListCellObjectBuilderFactory {
    
    class func builderForObject(_ dictionary: IDDictionary) -> IDDictionariesListCellObjectBuilder {
        return IDDictionariesListDefaultCellObjectBuilder()
    }
    
    
}
