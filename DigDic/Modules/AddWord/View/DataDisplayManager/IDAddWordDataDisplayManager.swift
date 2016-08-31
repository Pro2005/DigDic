//
//  IDAddWordDataDisplayManager.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddWordDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    var dataSource = [IDAddWordDataHolder]()
    var delegate: IDAddWordDataDisplayManagerDelegate?
    
    // MARK: Public
    
    func addCellForSelectingImage() {
        let imageDataHolder = IDAddWordImageDataHolder()
        dataSource.append(imageDataHolder)
    }
 
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dataHolder = self.dataSource[indexPath.row]
        if let cellObjectBuilder = IDAddWordCellObjectBuilderFactory.builderForDataHolder(dataHolder) {
            let cell = cellObjectBuilder.cellObjectForDataHolder(dataHolder)
            return cell as! UITableViewCell
        }
        return UITableViewCell()
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dataHolder = self.dataSource[indexPath.row]
        switch dataHolder {
        case _ as IDAddWordImageDataHolder:
            if let delegate = self.delegate {
               delegate.dataDisplayManagerWantSelectImage(self)
            }
        default:
            return
        }
    }
    
}