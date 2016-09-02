//
//  IDAddWordDataDisplayManagerDelegate.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/31/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

protocol IDAddWordDataDisplayManagerDelegate {
    
    func dataDisplayManagerWantSelectImage(dataDisplayManager: IDAddWordDataDisplayManager, indexPath: NSIndexPath) -> Void
    
}