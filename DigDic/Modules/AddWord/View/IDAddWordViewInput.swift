//
//  AddWordIDAddWordViewInput.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

protocol IDAddWordViewInput: IDBaseViewInput {

    func setupInitialState()
    func addFormForSelectingImage()
    func displayDialogForSelectingImage(completion: (result: UIImage?) -> Void)
    func displayDialogForCropImage(image: UIImage, dataHolder: IDAddWordDataHolder)
    func updateImageForDataHolder(image: UIImage, dataHolder: IDAddWordDataHolder)
    func numberWords() -> Int
    func dataHoldersForWordNumber(number: Int) -> [IDAddWordDataHolder]?
    
}
