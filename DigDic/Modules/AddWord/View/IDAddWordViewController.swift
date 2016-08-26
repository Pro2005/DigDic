//
//  AddWordIDAddWordViewController.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDAddWordViewController: UIViewController, IDAddWordViewInput {

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
    
    @IBAction func closePressed(sender: AnyObject) {
        self.output.closePressed()
    }

    // MARK: IDAddWordViewInput
    func setupInitialState() {
    }
    
    func currentNavigationController() -> UINavigationController? {
        return nil
    }
    
    func setupBackTableViewDataSource(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        
    }
    
    func setupFrontTableViewDataSource(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        
    }
}
