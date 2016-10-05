//
//  IDDictionariesListDataDisplayManagerDelegate.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/30/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionariesListDataDisplayManagerDelegate {
    
    func dictionariesListDataDisplayManager(_ manager: IDDictionariesListDataDisplayManager, didSelectDictionary dictionary: IDDictionary, reverseOrder: Bool)
    func dictionariesListDataDisplayManager(_ manager: IDDictionariesListDataDisplayManager, wantRemoveDictionary dictionary: IDDictionary)
    
}
