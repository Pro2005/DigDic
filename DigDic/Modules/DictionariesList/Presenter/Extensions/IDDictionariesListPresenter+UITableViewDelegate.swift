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
        guard let dictionary = self.interactor.dictionaryByIndex(indexPath.row) else {
            return
        }
        guard let navigationController = self.view.getNavigationController() else {
            return
        }
        self.router.pushDictionaryDetailScreenWithDictionary(dictionary, navigationController: navigationController)
    }
    
}