//
//  IDLocalDataBaseSource.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class IDLocalDataBaseSource: IDDictionarySource {
    
    // MARK: IDDictionarySourceProtocol
    func fetchDictionaries(completion: ([IDDictionary]) -> ()) {
        let realm = try! Realm()
        let result = realm.objects(IDLDBDictionary)
        let dictionaries = result.map{$0 as IDDictionary}
        completion(dictionaries)
    }
    
    func addDictionaryWithName(name: String) {
        let newDictionary = IDLDBDictionary()
        newDictionary.name = name
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(newDictionary)
        }
    }
    
    func flashcardModelForFilling() -> IDFlashcard {
        let flashcard = IDLDBFlashcard()
        return flashcard
    }
    
    func addFlashcardDataWithImageName(imageName: String) -> IDFlashcardData {
        let flashcardData = IDLDBFlashcardData()
        flashcardData.imageName = imageName
        flashcardData.type = .Image
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(flashcardData)
        }
        return flashcardData
    }
    
    func addFlashcard(flashcard: IDFlashcard, toDictionary dictionary: IDDictionary) {
        guard let flashcard = flashcard as? IDLDBFlashcard else {
            return
        }
        guard let dictionary = dictionary as? IDLDBDictionary else {
            return
        }
        let realm = try! Realm()
        try! realm.write {
            realm.add(flashcard)
            dictionary.addCard(flashcard)
        }
    }
    
    func connectFlashcardsTogether(inout faceFlashcard: IDFlashcard, inout backFlashcard: IDFlashcard) {
        let realm = try! Realm()
        try! realm.write {
            faceFlashcard.connectedFlashcard = backFlashcard
            backFlashcard.connectedFlashcard = faceFlashcard
            backFlashcard.back = true
        }
    }
    
}