//
//  IDDictionaryDetailDataDisplayManager.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/4/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDDictionaryDetailDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    let flashcard: IDFlashcard!
    
    init(flashcard: IDFlashcard) {
        self.flashcard = flashcard
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = self.flashcard.data {
            return data.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let data = self.flashcard.data![indexPath.row]
        if let cellObjectBuilder = IDDictionaryDetailCellObjectBuilderFactory.builderForFlashcardData(data) {
            let cell = cellObjectBuilder.cellObjectForFlashcardData(data)
            return cell as! UITableViewCell
        }
        return UITableViewCell()
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}