//
//  IDAddFlashcardSelectImageCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddFlashcardSelectImageCellObjectBuilder: IDAddFlashcardCellObjectBuilder {
    
    func cellObjectForDataHolder(dataHolder: IDAddFlashcardDataHolder, tableView: UITableView) -> IDAddFlashcardCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(IDAddFlashcardSelectImageCell)) as! IDAddFlashcardCell
        cell.loadFromDataHolder(dataHolder)
        return cell
    }
    
    static func registerCellForTableView(tableView: UITableView) {
        tableView.registerNib(UINib.init(nibName: String(IDAddFlashcardSelectImageCell), bundle: nil), forCellReuseIdentifier: String(IDAddFlashcardSelectImageCell))
    }
    
}