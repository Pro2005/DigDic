//
//  IDDictionariesListDataDisplayManagerDelegate.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/30/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionariesListDataDisplayManagerDelegate {
    
    func dictionariesListDataDisplayManager(manager: IDDictionariesListDataDisplayManager, didSelectDictionary dictionary: IDDictionary)
    
}