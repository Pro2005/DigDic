//
//  DictionariesListIDDictionariesListViewOutput.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

protocol IDDictionariesListViewOutput: IDBaseViewOutput {

    func didTapAddButton()
    func didTapCreateDictionaryButtonWithDictionaryName(_ name: String)
    func didSelectDictionary(_ dictionary: IDDictionary, reverseOrder: Bool)
    func wantRemoveDictionary(_ dictionary: IDDictionary)
    
}
