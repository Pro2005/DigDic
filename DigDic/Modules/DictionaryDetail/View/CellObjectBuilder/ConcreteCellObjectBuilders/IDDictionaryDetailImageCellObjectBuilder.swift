//
//  IDDictionaryDetailImageCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/4/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDDictionaryDetailImageCellObjectBuilder: IDDictionaryDetailCellObjectBuilder {
    
    func cellObjectForCardData(_ cardData: IDCardData) -> IDDictionaryDetailCell {
        let view = Bundle.main.loadNibNamed(String(describing: IDDictionaryDetailImageCell.self), owner: nil, options: nil)!.last
        let cell = view as! IDDictionaryDetailImageCell
        cell.loadWithData(cardData)
        return cell
    }
    
}
