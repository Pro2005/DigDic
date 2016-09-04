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
    
    func flashcardModelForFilling() -> IDFlashcard {
        return self.source.flashcardModelForFilling()
    }
    
    func addFlashcardImageWithImageName(imageName: String) -> IDFlashcardImage {
        return self.source.addFlashcardImageWithImageName(imageName)
    }
    
    func addFlashcard(flashcard: IDFlashcard, toDictionary dictionary: IDDictionary) {
        self.source.addFlashcard(flashcard, toDictionary: dictionary)
    }
    
}