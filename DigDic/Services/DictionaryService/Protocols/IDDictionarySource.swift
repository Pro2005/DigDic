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
    func flashcardModelForFilling() -> IDFlashcard
    func addFlashcardDataWithImageName(imageName: String) -> IDFlashcardData
    func addFlashcard(flashcard: IDFlashcard, toDictionary dictionary: IDDictionary)
    func connectFlashcardsTogether(inout faceFlashcard: IDFlashcard, inout backFlashcard: IDFlashcard)
    
}