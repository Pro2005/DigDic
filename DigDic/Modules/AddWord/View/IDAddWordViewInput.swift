//
//  AddWordIDAddWordViewInput.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

protocol IDAddWordViewInput: IDBaseViewInput {

    func setupInitialState()
    func setupBackTableViewDataSource(dataSource: UITableViewDataSource, delegate: UITableViewDelegate)
    func setupFrontTableViewDataSource(dataSource: UITableViewDataSource, delegate: UITableViewDelegate)

}