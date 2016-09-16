//
//  AddFlashcardIDAddFlashcardViewOutput.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//
import UIKit

protocol IDAddFlashcardViewOutput: IDBaseViewOutput {

    /**
        @author ls
        Notify presenter that view is ready
    */

    func viewIsReady()
    func didTapCloseButton()
    func didTapAddButton()
    func didTapAddImageButton()
    func didTapAddTextButton()
    func didTapSelectImageButton(dataHolder: IDAddFlashcardDataHolder)
    func didCropImage(image: UIImage, dataHolder: IDAddFlashcardDataHolder)
    
}
