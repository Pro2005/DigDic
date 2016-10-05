//
//  IDDictionariesListCell.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/10/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDDictionariesListCell: UITableViewCell, IDDictionariesListReverseOrder {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var toggle: UISwitch!
    
    override func prepareForReuse() {
        self.titleLabel.text = ""
        self.toggle.isOn = false
    }
    
    // MARK: - IDDictionariesListReverseOrder
    
    func hasReverseOrder() -> Bool {
        return self.toggle.isOn
    }
    
}
