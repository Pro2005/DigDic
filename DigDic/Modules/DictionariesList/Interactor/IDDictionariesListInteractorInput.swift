//
//  IDDictionariesListIDDictionariesListInteractorInput.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionariesListInteractorInput: BaseInteractorInput {

    func fetchDictionaries(_ competion: ([Dictionary]) -> ())
    func addNewDictionaryWithName(_ name: String)
    func removeDictionary(_ dictionary: Dictionary)
    
}
