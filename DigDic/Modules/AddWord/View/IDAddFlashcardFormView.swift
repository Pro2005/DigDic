//
//  IDAddFlashcardFormView.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/30/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class IDAddFlashcardFormView: UIView {
    var tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
    var footerHeight: CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.tableView.backgroundColor = UIColor.clear
        
        if let height = self.footerHeight, let footerView = self.tableView.tableFooterView {
            self.updateFooterHeight(footerView, height: height)
        }
    }
    
    override func updateConstraints() {
        if self.tableView.constraints.count == 0 && self.tableView.superview != nil {
            self.tableView.autoPinEdgesToSuperviewEdges()
        }
        
        super.updateConstraints()
    }
    
    // MARK: Public
    
    func setupTableViewFooter(_ footer: UIView, footerHeight: CGFloat) {
        self.tableView.tableFooterView = footer
        self.footerHeight = footerHeight
    }
    
    func setupTableViewDataSource(_ dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        self.tableView.dataSource = dataSource
        self.tableView.delegate = delegate
    }
    
    func registerNibsWithClassNames(_ classNames: [String]) {
        for name in classNames {
            self.tableView.register(UINib.init(nibName: name, bundle: nil), forCellReuseIdentifier: name)
        }
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    // MARK: Private
    
    fileprivate func setup() {
        self.addSubview(self.tableView)
//        self.tableView.allowsSelection = false;
        
    }
    
    // MARK: Private
    fileprivate func updateFooterHeight(_ footer: UIView, height: CGFloat) {
        var frame = footer.frame
        frame.size.height = height
        footer.frame = frame
    }
    
}
