//
//  IDAddFlashcardTestCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 16.09.16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddFlashcardTextCellObjectBuilder: IDAddFlashcardCellObjectBuilder {
    
    func cellObjectForDataHolder(dataHolder: IDAddFlashcardDataHolder, tableView: UITableView) -> IDAddFlashcardCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(IDAddFlashcardTextCell)) as! IDAddFlashcardCell
        cell.loadFromDataHolder(dataHolder)
        return cell
    }
    
    static func registerCellForTableView(tableView: UITableView) {
        tableView.registerNib(UINib.init(nibName: String(IDAddFlashcardTextCell), bundle: nil), forCellReuseIdentifier: String(IDAddFlashcardTextCell))
    }
    
}