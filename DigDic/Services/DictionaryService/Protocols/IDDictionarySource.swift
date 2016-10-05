//
//  IDDictionaryServiceProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionarySource {
    
    func fetchDictionaries(_ completion: ([IDDictionary]) -> ())
    func addDictionaryWithName(_ name: String)
    
    func cardModelForFilling() -> IDCard
    func addCardDataWithImageName(_ imageName: String) -> IDCardData
    func createFlashcard(_ frontCard: IDCard, backCard: IDCard, toDictionary dictionary: IDDictionary) -> IDFlashcard?
    func removeFlashcard(_ flashcard: IDFlashcard, fromDictionary dictionary: IDDictionary)
    func removeDictionary(_ dictionary: IDDictionary)
    
}
