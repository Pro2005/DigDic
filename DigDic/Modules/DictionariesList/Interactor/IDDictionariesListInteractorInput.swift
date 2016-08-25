//
//  IDDictionariesListIDDictionariesListInteractorInput.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionariesListInteractorInput: IDBaseInteractorInput {

    func fetchDictionaries(competion: ([IDDictionary]) -> ())
    func addNewDictionaryWithName(name: String)
    
}
