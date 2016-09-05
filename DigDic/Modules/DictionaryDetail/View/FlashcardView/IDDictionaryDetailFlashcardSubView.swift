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
//    let flashcard: IDFlashcard
    var tableView: UITableView = UITableView(frame: CGRectZero, style: .Plain)
    
    init() {
        super.init(frame: CGRectZero)
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
    
    func setupTableViewDataSource(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        self.tableView.dataSource = dataSource
        self.tableView.delegate = delegate
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    // MARK: Private
    
    private func setup() {
        self.addSubview(self.tableView)
    }
    
}