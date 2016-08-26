//
//  ACAddWordPresenter+UITableViewDataSource.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/26/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

extension IDAddWordPresenter: UITableViewDataSource {
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell(style: .Default, reuseIdentifier: " ")
    }
    
}