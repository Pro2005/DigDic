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
    
    func addCellForText() {
        let textDataHolder = IDAddFlashcardTextDataHolder()
        dataSource.append(textDataHolder)
    }
    
    func updateImage(_ image: UIImage, indexPath: IndexPath) {
        let dataHolder = self.dataSource[(indexPath as NSIndexPath).row]
        guard let imageDataHolder = dataHolder as? IDAddFlashcardImageDataHolder else {
            return
        }
        imageDataHolder.image = image
    }
    
    func classNamesForRegistration() -> [String] {
        return IDAddFlashcardCellObjectBuilderFactory.classNamesForRegistration()
    }
 
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataHolder = self.dataSource[(indexPath as NSIndexPath).row]
        if let cellObjectBuilder = IDAddFlashcardCellObjectBuilderFactory.builderForDataHolder(dataHolder) {
            let cell = cellObjectBuilder.cellObjectForDataHolder(dataHolder, tableView: tableView)
            return cell as! UITableViewCell
        }
        return UITableViewCell()
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataHolder = self.dataSource[(indexPath as NSIndexPath).row]
        switch dataHolder {
        case _ as IDAddFlashcardImageDataHolder:
            if let delegate = self.delegate {
                delegate.dataDisplayManagerWantSelectImage(self, dataHolder: dataHolder)
            }
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
