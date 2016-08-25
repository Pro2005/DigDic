//
//  IDLDBWord.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/24/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class IDLDBWord: Object, IDWord {
    // MARK: IDWordProtocol
    dynamic var name: String?
}