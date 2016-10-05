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
    
    func registerCellForTableView(_ tableView: UITableView) {
        tableView.register(UINib.init(nibName: String(describing: IDDictionariesListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: IDDictionariesListCell.self))
    }
    
    func updateTableViewModelWithDictionaries(_ dictionaries: [IDDictionary]) {
        self.dataSource.removeAll()
        self.dataSource += dictionaries
    }
   
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellObjectBuilder = IDDictionariesListCellObjectBuilderFactory.builderForObject(self.dataSource[(indexPath as NSIndexPath).row])
        let cell = cellObjectBuilder.buildCellObjectForData(self.dataSource[(indexPath as NSIndexPath).row], tableView: tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegate?.dictionariesListDataDisplayManager(self, wantRemoveDictionary: self.dataSource[(indexPath as NSIndexPath).row])
        }
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard (indexPath as NSIndexPath).row < self.dataSource.count else {
            return
        }
        guard let delegate = self.delegate else {
            return
        }
        let dictionary = self.dataSource[(indexPath as NSIndexPath).row]
        if let cell = tableView.cellForRow(at: indexPath) as? IDDictionariesListReverseOrder {
            delegate.dictionariesListDataDisplayManager(self, didSelectDictionary: dictionary, reverseOrder: cell.hasReverseOrder())
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
