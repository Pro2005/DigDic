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
    
    func buildCellObjectForData(_ dictionary: IDDictionary, tableView: UITableView) -> UITableViewCell {
        let identifier = String(describing: IDDictionariesListCell.self)
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? IDDictionariesListCell {
            if let name = dictionary.name {
                cell.titleLabel.text = name + " - \(dictionary.flashcards.count)"
            }
            return cell
        }
        return UITableViewCell()
    }
    
}
