//
//  DictionariesListIDDictionariesListViewInput.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

protocol IDDictionariesListViewInput: IDBaseViewInput {

    func setupTableViewDataSource(dataSource: UITableViewDataSource, delegate: UITableViewDelegate)
    func reloadData()
    
}
