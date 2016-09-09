//
//  IDDictionaryService.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDDictionaryService: IDBaseService {
    var source: IDDictionarySource
    
    init(source: IDDictionarySource) {
        self.source = source
    }
    
    // MARK: Public
    func fetchDictionaries(completion: ([IDDictionary]) -> ()) {
        self.source.fetchDictionaries(completion)
    }
    
    func addDictionaryWithName(name: String) {
        self.source.addDictionaryWithName(name)
    }
    
    func cardModelForFilling() -> IDCard {
        return self.source.cardModelForFilling()
    }
    
    func addCardDataWithImageName(imageName: String) -> IDCardData {
        return self.source.addCardDataWithImageName(imageName)
    }
    
    func createFlashcard(frontCard: IDCard, backCard: IDCard, toDictionary dictionary: IDDictionary) -> IDFlashcard? {
        return self.source.createFlashcard(frontCard, backCard: backCard, toDictionary: dictionary)
    }
    
    func removeFlashcard(flashcard: IDFlashcard, fromDictionary dictionary: IDDictionary) {
        self.source.removeFlashcard(flashcard, fromDictionary: dictionary)
    }
        
}