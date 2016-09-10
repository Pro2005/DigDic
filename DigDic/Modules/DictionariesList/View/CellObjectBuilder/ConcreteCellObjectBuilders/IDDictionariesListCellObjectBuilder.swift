//
//  IDDictionariesListCellObjectBuilder.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/10/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

protocol IDDictionariesListCellObjectBuilder {
    
    func buildCellObjectForData(dictionary: IDDictionary, tableView: UITableView) -> UITableViewCell
    
}