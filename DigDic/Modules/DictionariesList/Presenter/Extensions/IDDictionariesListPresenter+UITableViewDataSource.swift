//
//  IDDictionariesListPresenter+UITableViewDataSource.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/18/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

extension IDDictionariesListPresenter: UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interactor.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = String(UITableViewCell)
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier) ?? UITableViewCell(style: .Default, reuseIdentifier: identifier)
        guard let dictionary = self.interactor.dictionaryByIndex(indexPath.row) else {
            return cell;
        }
        cell.textLabel?.text = dictionary.name
        return cell
    }
}