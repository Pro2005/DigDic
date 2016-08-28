//
//  DictionaryDetailIDDictionaryDetailViewController.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionaryDetailViewController: IDBaseViewController, IDDictionaryDetailViewInput {

    var output: IDDictionaryDetailViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    
    // MARK: Actions
    
    @IBAction func didTapAddButton(sender: AnyObject) {
        self.output.didTapAddButton()
    }

    // MARK: IDDictionaryDetailViewInput
    
    func updateTitle(title: String) {
        self.title = title
    }
    
}
