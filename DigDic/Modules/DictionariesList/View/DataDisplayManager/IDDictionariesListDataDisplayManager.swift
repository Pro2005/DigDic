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
    
    func registerCellForTableView(tableView: UITableView) {
        tableView.registerNib(UINib.init(nibName: String(IDDictionariesListCell), bundle: nil), forCellReuseIdentifier: String(IDDictionariesListCell))
    }
    
    func updateTableViewModelWithDictionaries(dictionaries: [IDDictionary]) {
        self.dataSource.removeAll()
        self.dataSource += dictionaries
    }
   
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellObjectBuilder = IDDictionariesListCellObjectBuilderFactory.builderForObject(self.dataSource[indexPath.row])
        let cell = cellObjectBuilder.buildCellObjectForData(self.dataSource[indexPath.row], tableView: tableView)
        return cell
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            delegate?.dictionariesListDataDisplayManager(self, wantRemoveDictionary: self.dataSource[indexPath.row])
        }
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
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? IDDictionariesListReverseOrder {
            delegate.dictionariesListDataDisplayManager(self, didSelectDictionary: dictionary, reverseOrder: cell.hasReverseOrder())
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
}