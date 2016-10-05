//
//  IDDictionaryDetailFlashcardView.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/4/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDDictionaryDetailFlashcardSubView: UIView {
    var tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if self.tableView.constraints.count == 0 && self.tableView.superview != nil {
            self.tableView.autoPinEdgesToSuperviewEdges()
        }
        
        super.updateConstraints()
    }
    
    // MARK: Public
    
    func setupTableViewDataSource(_ dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        self.tableView.dataSource = dataSource
        self.tableView.delegate = delegate
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    // MARK: Private
    
    fileprivate func setup() {
        self.addSubview(self.tableView)
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.clear
    }
    
}
