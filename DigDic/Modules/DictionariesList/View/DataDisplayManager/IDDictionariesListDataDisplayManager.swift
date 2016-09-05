//
//  IDDictionariesListDataDisplayManager.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/29/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDDictionariesListDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    var dataSource = [IDDictionary]()
    var delegate: IDDictionariesListDataDisplayManagerDelegate?
    // MARK: Public
    
    func updateTableViewModelWithDictionaries(dictionaries: [IDDictionary]) {
        self.dataSource.removeAll()
        self.dataSource += dictionaries
    }
   
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = String(UITableViewCell)
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier) ?? UITableViewCell(style: .Default, reuseIdentifier: identifier)
        guard indexPath.row < self.dataSource.count else {
            return cell
        }
        let dictionary = self.dataSource[indexPath.row]
        cell.textLabel?.text = dictionary.name
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard indexPath.row < self.dataSource.count else {
            return
        }
        guard let delegate = self.delegate else {
            return
        }
        let dictionary = self.dataSource[indexPath.row]
        delegate.dictionariesListDataDisplayManager(self, didSelectDictionary: dictionary)
    }
    
}