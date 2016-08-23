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
        let identifier = "defaultCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier) ?? UITableViewCell(style: .Default, reuseIdentifier: identifier)
        if indexPath.row < self.interactor.dataSource.count {
            let model = self.interactor.dataSource[indexPath.row]
            cell.textLabel?.text = model.name
        }
        
        return cell
    }
}