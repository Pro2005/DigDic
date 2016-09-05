//
//  IDWordProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/24/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDFlashcard {
    var data: [IDFlashcardData]? {get set}
    var back: Bool {get set}
    var connectedFlashcard: IDFlashcard? {get set}
}