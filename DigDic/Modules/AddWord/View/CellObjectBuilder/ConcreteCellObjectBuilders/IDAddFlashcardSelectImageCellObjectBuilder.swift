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
    
    func cellObjectForDataHolder(_ dataHolder: IDAddFlashcardDataHolder, tableView: UITableView) -> IDAddFlashcardCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: IDAddFlashcardSelectImageCell.self)) as! IDAddFlashcardCell
        cell.loadFromDataHolder(dataHolder)
        return cell
    }

    static func classNameForRegistration() -> String {
        return String(describing: IDAddFlashcardSelectImageCell.self)
    }
    
}
