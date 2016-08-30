//
//  AddWordIDAddWordViewController.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDAddWordViewController: IDBaseViewController, IDAddWordViewInput {

    var output: IDAddWordViewOutput!
    @IBOutlet weak var frontTableView: UITableView!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var backTableView: UITableView!
    @IBOutlet weak var backView: UIView!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: Actions
    
    @IBAction func didTapCloseButton(sender: AnyObject) {
        self.output.didTapCloseButton()
    }

    // MARK: IDAddWordViewInput
    
    func setupBackTableViewDataSource(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        
    }
    
    func setupFrontTableViewDataSource(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        
    }
    
    // MARK: Protected
    
    override func setupInitialState() {
        if let footerView = NSBundle.mainBundle().loadNibNamed(String(IDAddWordFooterView), owner: nil, options: nil).last {
            self.frontTableView.tableFooterView = footerView as? UIView
        }
    }
    
}
