//
//  AddFlashcardIDAddFlashcardViewInput.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

protocol IDAddFlashcardViewInput: IDBaseViewInput {

    func setupInitialState()
    func addFormForSelectingImage()
    func addFormForText()
    func displayDialogForSelectingImage(completion: (result: UIImage?) -> Void)
    func displayDialogForCropImage(image: UIImage, dataHolder: IDAddFlashcardDataHolder)
    func updateImageForDataHolder(image: UIImage, dataHolder: IDAddFlashcardDataHolder)
    func frontDataHolders() -> [IDAddFlashcardDataHolder]
    func backDataHolders() -> [IDAddFlashcardDataHolder]
    
}
