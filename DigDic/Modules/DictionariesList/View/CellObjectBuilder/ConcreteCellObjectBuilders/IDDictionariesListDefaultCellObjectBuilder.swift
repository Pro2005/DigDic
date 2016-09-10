//
//  IDDictionariesListDefaultCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/10/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDDictionariesListDefaultCellObjectBuilder: IDDictionariesListCellObjectBuilder {
    
    func buildCellObjectForData(dictionary: IDDictionary, tableView: UITableView) -> UITableViewCell {
        let identifier = String(IDDictionariesListCell)
        if let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? IDDictionariesListCell {
            if let name = dictionary.name {
                cell.titleLabel.text = name
            }
            return cell
        }
        return UITableViewCell()
    }
    
}