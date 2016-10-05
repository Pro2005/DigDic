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
    
    func cellObjectForDataHolder(_ dataHolder: IDAddFlashcardDataHolder, tableView: UITableView) -> IDAddFlashcardCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: IDAddFlashcardTextCell.self)) as! IDAddFlashcardCell
        cell.loadFromDataHolder(dataHolder)
        return cell
    }

    
    static func classNameForRegistration() -> String {
        return String(describing: IDAddFlashcardTextCell.self)
    }
    
}
