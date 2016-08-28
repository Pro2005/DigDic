//
//  DictionariesListIDDictionariesListViewController.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionariesListViewController: IDBaseViewController, IDDictionariesListViewInput {
    
    // MARK: Constants
    enum Constants {
        static let title = "dictionaries_list_title"
        static let addButtonTitle = "dictionaries_list_add_button_title"
        static let addButtonFontSize = 12
    }
    
    // MARK: Properties
    var output: IDDictionariesListViewOutput!
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: Actions
    func didTapAddButton(sender: AnyObject) {
        self.output.didTapAddButton()
    }

    // MARK: <IDDictionariesListViewInput>
    
    override func setupInitialState() {
        self.title = Constants.title.localized()
        let addButton = self.navigationItem.addButtonWithTitle(Constants.addButtonTitle.localized(), alignment: .Right, font: UIFont.systemFontOfSize(CGFloat(Constants.addButtonFontSize)))
        addButton.addTarget(self, action: #selector(didTapAddButton), forControlEvents: .TouchUpInside)
    }

    func setupTableViewDataSource(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        self.tableView.dataSource = dataSource
        self.tableView.delegate = delegate
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func showAlertController(alertController: UIAlertController) {
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    // MARK: Private
    
    private func addButtonInNavigationBar() {
        
    }
}
