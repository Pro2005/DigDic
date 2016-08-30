//
//  IDAddWordFormView.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/30/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class IDAddWordFormView: UIView {
    var tableView: UITableView = UITableView(frame: CGRectZero, style: .Plain)
    var footerHeight: CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let height = self.footerHeight, footerView = self.tableView.tableFooterView {
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
    
    func setupTableViewFooter(footer: UIView, footerHeight: CGFloat) {
        self.tableView.tableFooterView = footer
        self.footerHeight = footerHeight
    }
    
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
    
    // MARK: Private
    private func updateFooterHeight(footer: UIView, height: CGFloat) {
        var frame = footer.frame
        frame.size.height = height
        footer.frame = frame
    }
    
}