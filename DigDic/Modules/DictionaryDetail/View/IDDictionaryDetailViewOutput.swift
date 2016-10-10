//
//  DictionaryDetailIDDictionaryDetailViewOutput.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

protocol IDDictionaryDetailViewOutput: IDBaseViewOutput {

    /**
        @author ls
        Notify presenter that view is ready
    */

    func viewIsReady()
    func didTapAddButton()
    func didTapRemoveButton()
    func removeFlashcard(_ flashcard: IDFlashcard)
    func didLeftSwipe()
    func didRightSwipe()
    
}
