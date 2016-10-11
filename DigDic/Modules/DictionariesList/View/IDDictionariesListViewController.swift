//
//  DictionariesListIDDictionariesListViewController.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionariesListViewController: BaseViewController, IDDictionariesListViewInput, IDDictionariesListDataDisplayManagerDelegate {
    
    // MARK: Constants
    enum Constants {
        static let dictionariesListTitleText            = "dictionaries_list_title"
        static let dictionariesListAddButtonTitleText   = "dictionaries_list_add_button_title"
        static let addButtonFontSize                    = 12
        static let addDictionaryText                    = "Add dictionary"
        static let nameOfNewDictionaryText              = "name of new dictionary"
        static let addText                              = "Add"
        static let cancelText                           = "Cancel"
    }
    
    // MARK: Properties
    var output: IDDictionariesListViewOutput!
    var dataDisplayManager: IDDictionariesListDataDisplayManager!
    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: Actions
    func didTapAddButton(_ sender: AnyObject) {
        self.output.didTapAddButton()
    }

    // MARK: <IDDictionariesListViewInput>
    
    override func setupInitialState() {
        self.title = Constants.dictionariesListTitleText.localized()
        let addButton = self.navigationItem.addButtonWithTitle(Constants.dictionariesListAddButtonTitleText.localized(), alignment: .right, font: UIFont.systemFont(ofSize: CGFloat(Constants.addButtonFontSize)))
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        self.dataDisplayManager.registerCellForTableView(self.tableView)
        self.tableView.dataSource = self.dataDisplayManager
        self.tableView.delegate = self.dataDisplayManager
        self.dataDisplayManager.delegate = self
    }
    
    func reloadDataWith(Dictionaries dictionaries: [Dictionary]) {
        self.dataDisplayManager.updateTableViewModelWithDictionaries(dictionaries)
        self.tableView.reloadData()
    }

    func showFormForCreatingNewDictionary() {
        let alertController = UIAlertController(title: Constants.addDictionaryText.localized(), message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = Constants.nameOfNewDictionaryText.localized()
        }
        let addAction = UIAlertAction(title: Constants.addText.localized(), style: .default) { [unowned self](alertAction: UIAlertAction) in
            guard let textField = alertController.textFields?.first else {
                return
            }
            guard let text = textField.text else {
                return
            }
            self.output.didTapCreateDictionaryButtonWithDictionaryName(text)
        }
        let cancelAction = UIAlertAction(title: Constants.cancelText.localized(), style: .destructive) { (alertAction: UIAlertAction) in
            
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: IDDictionariesListDataDisplayManagerDelegate

    func dictionariesListDataDisplayManager(_ manager: IDDictionariesListDataDisplayManager, didSelectDictionary dictionary: Dictionary, reverseOrder: Bool) {
        self.output.didSelectDictionary(dictionary, reverseOrder: reverseOrder)
    }
    
    func dictionariesListDataDisplayManager(_ manager: IDDictionariesListDataDisplayManager, wantRemoveDictionary dictionary: Dictionary) {
        self.output.wantRemoveDictionary(dictionary)
    }
    
    // MARK: Private
    
    fileprivate func addButtonInNavigationBar() {
        
    }
}
