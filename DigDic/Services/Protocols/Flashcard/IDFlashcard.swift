//
//  IDWordProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/24/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDFlashcard {
    var imageNames: [IDFlashcardImage]? {get set}
    var texts: [IDFlashcardText]? {get set}
    var back: Bool {get set}
    var card: IDFlashcard? {get set}
}