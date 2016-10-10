//
//  IDDictionaryDetailTextCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 10/9/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDDictionaryDetailTextCellObjectBuilder: IDDictionaryDetailCellObjectBuilder {

    func cellObjectForCardData(_ cardData: CardData) -> IDDictionaryDetailCell {
        let view = Bundle.main.loadNibNamed(String(describing: IDDictionaryDetailTextCell.self), owner: nil, options: nil)!.last
        let cell = view as! IDDictionaryDetailTextCell
        cell.loadWithData(cardData)
        return cell
    }
    
}
