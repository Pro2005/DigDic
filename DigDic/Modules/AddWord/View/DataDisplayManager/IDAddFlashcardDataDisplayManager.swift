//
//  IDAddFlashcardDataDisplayManager.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddFlashcardDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    var dataSource = [IDAddFlashcardDataHolder]()
    var delegate: IDAddFlashcardDataDisplayManagerDelegate?
    
    // MARK: Public
    
    func addCellForSelectingImage() {
        let imageDataHolder = IDAddFlashcardImageDataHolder()
        dataSource.append(imageDataHolder)
    }
    
    func updateImage(image: UIImage, indexPath: NSIndexPath) {
        let dataHolder = self.dataSource[indexPath.row]
        guard let imageDataHolder = dataHolder as? IDAddFlashcardImageDataHolder else {
            return
        }
        imageDataHolder.image = image
    }
 
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dataHolder = self.dataSource[indexPath.row]
        if let cellObjectBuilder = IDAddFlashcardCellObjectBuilderFactory.builderForDataHolder(dataHolder) {
            let cell = cellObjectBuilder.cellObjectForDataHolder(dataHolder)
            return cell as! UITableViewCell
        }
        return UITableViewCell()
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dataHolder = self.dataSource[indexPath.row]
        switch dataHolder {
        case _ as IDAddFlashcardImageDataHolder:
            if let delegate = self.delegate {
                delegate.dataDisplayManagerWantSelectImage(self, dataHolder: dataHolder)
            }
        default:
            return
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}