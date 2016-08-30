//
//  AddWordIDAddWordViewController.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDAddWordViewController: IDBaseViewController, IDAddWordViewInput, IDAddWordFooterViewDelegate {

    var output: IDAddWordViewOutput!
    @IBOutlet weak var frontView: IDAddWordFormView!


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
    
    // MARK: IDAddWordFooterViewDelegate
    
    func addWordFooterViewDidTapAddImageButton(footerView: IDAddWordFooterView) {
        self.output.didTapAddImageButton()
    }
    
    // MARK: Protected
    
    override func setupInitialState() {
        if let view = NSBundle.mainBundle().loadNibNamed(String(IDAddWordFooterView), owner: nil, options: nil).last {
            let footerView = view as! IDAddWordFooterView
            footerView.delegate = self
            self.frontView.setupTableViewFooter(footerView, footerHeight: IDAddWordFooterView.height())
        }
    }
    
    // MARK: Private
    
}
