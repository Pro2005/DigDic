//
//  DictionariesListIDDictionariesListViewInput.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//
import UIKit

protocol IDBaseViewInput: class {

    /**
        @author Ilya Denisov
        Setup initial state of the view
    */

    func setupInitialState()
    func currentNavigationController() -> UINavigationController?
    
}
