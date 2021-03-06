//
//  DictionaryDetailIDDictionaryDetailRouterInput.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

protocol IDDictionaryDetailRouterInput: BaseRouterInput {
    
    func presentAddFlashcardForDictionary(_ dictionary: Dictionary, delegate: IDAddFlashcardPresenterDelegate?)
    
}
