//
//  AddFlashcardIDAddFlashcardViewInput.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

protocol IDAddFlashcardViewInput: BaseViewInput {

    func setupInitialState()
    func addFormForSelectingImage()
    func addFormForText()
    func displayDialogForSelectingImage(_ completion: @escaping (UIImage?) -> Void)
    func displayDialogForCropImage(_ image: UIImage, dataHolder: IDAddFlashcardDataHolder)
    func updateImageForDataHolder(_ image: UIImage, dataHolder: IDAddFlashcardDataHolder)
    func frontDataHolders() -> [IDAddFlashcardDataHolder]
    func backDataHolders() -> [IDAddFlashcardDataHolder]
    
}
