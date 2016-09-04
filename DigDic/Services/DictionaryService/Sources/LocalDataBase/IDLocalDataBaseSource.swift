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
    
    func addFlashcardImageWithImageName(imageName: String) -> IDFlashcardImage {
        let flashcardImage = IDLDBFlashcardImage()
        flashcardImage.name = imageName
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(flashcardImage)
        }
        return flashcardImage
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
    
}