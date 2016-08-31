//
//  IDAddWordSelectImageCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDAddWordSelectImageCellObjectBuilder: IDAddWordCellObjectBuilder {
    
    func cellObjectForDataHolder(dataHolder: IDAddWordDataHolder) -> IDAddWordCell {
        let view = NSBundle.mainBundle().loadNibNamed(String(IDAddWordSelectImageCell), owner: nil, options: nil).last
        let cell = view as! IDAddWordSelectImageCell
        return cell
    }
    
}