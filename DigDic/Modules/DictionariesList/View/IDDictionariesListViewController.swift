//
//  DictionariesListIDDictionariesListViewController.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionariesListViewController: UIViewController, IDDictionariesListViewInput {
    
    // MARK: Constants
    enum Constants {
        static let dictionariesListTitle = "dictionaries_list_title"
    }
    
    // MARK: Properties
    var output: IDDictionariesListViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: IDDictionariesListViewInput
    func setupInitialState() {
        self.title = Constants.dictionariesListTitle.localized()
    }
}
