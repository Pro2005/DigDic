//
//  AddFlashcardIDAddFlashcardRouter.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDAddFlashcardRouter: BaseRouter, IDAddFlashcardRouterInput {

    func dismiss() {
        self.viewController .dismiss(animated: true, completion: nil)
    }
    
}
