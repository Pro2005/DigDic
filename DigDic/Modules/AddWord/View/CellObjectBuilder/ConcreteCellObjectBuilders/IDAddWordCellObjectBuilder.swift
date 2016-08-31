//
//  IDAddWordCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDAddWordCellObjectBuilder {
    
    func cellObjectForDataHolder(dataHolder: IDAddWordDataHolder) -> IDAddWordCell
    
}