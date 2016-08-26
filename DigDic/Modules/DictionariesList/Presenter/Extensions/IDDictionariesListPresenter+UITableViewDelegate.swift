//
//  IDDictionariesListPresenter+Delegate.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/18/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

extension IDDictionariesListPresenter: UITableViewDelegate {

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard indexPath.row < self.dataSource.count else {
            return
        }
        let dictionary = self.dataSource[indexPath.row]
        guard let navigationController = self.view.currentNavigationController() else {
            return
        }
        self.router.pushDictionaryDetailScreenWithDictionary(dictionary, navigationController: navigationController)
    }
    
}