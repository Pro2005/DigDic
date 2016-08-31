//
//  AddWordIDAddWordViewController.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDAddWordViewController: IDBaseViewController, IDAddWordViewInput, IDAddWordFooterViewDelegate, IDAddWordDataDisplayManagerDelegate {

    var output: IDAddWordViewOutput!
    @IBOutlet weak var frontView: IDAddWordFormView!
    let dataDisplayManager = IDAddWordDataDisplayManager()

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
    
    func addFormForSelectingImage() {
        self.dataDisplayManager.addCellForSelectingImage()
        self.frontView.reloadData()
    }
    
    // MARK: IDAddWordFooterViewDelegate
    
    func addWordFooterViewDidTapAddImageButton(footerView: IDAddWordFooterView) {
        self.output.didTapAddImageButton()
    }
    
    // MARK: IDAddWordDataDisplayManagerDelegate
    
    func dataDisplayManagerWantSelectImage(dataDisplayManager: IDAddWordDataDisplayManager) {
        self.output.didTapSelectImageButton()
    }
    
    // MARK: Protected
    
    override func setupInitialState() {
        if let view = NSBundle.mainBundle().loadNibNamed(String(IDAddWordFooterView), owner: nil, options: nil).last {
            let footerView = view as! IDAddWordFooterView
            footerView.delegate = self
            self.frontView.setupTableViewFooter(footerView, footerHeight: IDAddWordFooterView.height())
        }
        self.frontView.setupTableViewDataSource(self.dataDisplayManager, delegate: self.dataDisplayManager)
        self.dataDisplayManager.delegate = self
    }
    
    // MARK: Private
    
}
