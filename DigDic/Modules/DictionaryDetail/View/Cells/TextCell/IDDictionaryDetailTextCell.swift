//
//  IDDictionaryDetailTextCell.swift
//  DigDic
//
//  Created by Ilya Denisov on 10/9/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDDictionaryDetailTextCell: UITableViewCell, IDDictionaryDetailCell {
    @IBOutlet var label: UILabel!
    
    // MARK: Public
    
    func loadWithData(_ cardData: IDCardData) {
        guard let text = cardData.text else {
            return
        }
        label.text = text
    }
    
}
