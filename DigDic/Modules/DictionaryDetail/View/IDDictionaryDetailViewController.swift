//
//  DictionaryDetailIDDictionaryDetailViewController.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionaryDetailViewController: UIViewController, IDDictionaryDetailViewInput {

    var output: IDDictionaryDetailViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: IDDictionaryDetailViewInput
    func setupInitialState() {
    }
    
    func getNavigationController() -> UINavigationController? {
        return self.navigationController
    }
    
}
