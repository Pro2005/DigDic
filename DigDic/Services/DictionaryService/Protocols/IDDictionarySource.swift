//
//  IDDictionaryServiceProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionarySource {
    
    func fetchDictionaries(completion: ([IDDictionary]) -> ())
    func addDictionaryWithName(name: String)
    
    func cardModelForFilling() -> IDCard
    func addCardDataWithImageName(imageName: String) -> IDCardData
    func createFlashcard(frontCard: IDCard, backCard: IDCard, toDictionary dictionary: IDDictionary) -> IDFlashcard?
    func removeFlashcard(flashcard: IDFlashcard, fromDictionary dictionary: IDDictionary)
    func removeDictionary(dictionary: IDDictionary)
    
}