//
//  IDDictionaryServiceProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol Service {
    
    func fetchDictionaries(_ completion: ([Dictionary]) -> ())
    func addDictionaryWithName(_ name: String)
    
    func cardModelForFilling() -> Card
    func addCardDataWithImageName(_ imageName: String) -> CardData
    func addCardDataWith(text: String) -> CardData
    func createFlashcard(_ frontCard: Card, backCard: Card, toDictionary dictionary: Dictionary) -> Flashcard?
    func removeFlashcard(_ flashcard: Flashcard, fromDictionary dictionary: Dictionary)
    func removeDictionary(_ dictionary: Dictionary)
    
}
