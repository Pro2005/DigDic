//
//  DictionaryDetailIDDictionaryDetailViewInput.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

protocol IDDictionaryDetailViewInput: IDBaseViewInput {

    /**
        @author ls
        Setup initial state of the view
    */

    func setupInitialState()
    func updateTitle(title: String)
}
