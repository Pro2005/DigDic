//
//  IDDictionaryServiceProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionarySourceProtocol {
    
    func fetchDictionaries(completion: ([IDDictionaryProtocol]) -> ())
    func addDictionaryWithName(name: String)
    
}