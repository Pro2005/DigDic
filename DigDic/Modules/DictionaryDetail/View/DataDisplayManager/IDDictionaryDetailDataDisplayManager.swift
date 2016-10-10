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
    let card: Card!
    
    init(card: Card) {
        self.card = card
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = self.card.data {
            return data.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = self.card.data![(indexPath as NSIndexPath).row]
        if let cellObjectBuilder = IDDictionaryDetailCellObjectBuilderFactory.builderForCardData(data) {
            let cell = cellObjectBuilder.cellObjectForCardData(data)
            return cell as! UITableViewCell
        }
        return UITableViewCell()
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
