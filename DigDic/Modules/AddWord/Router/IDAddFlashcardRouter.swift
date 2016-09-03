//
//  AddFlashcardIDAddFlashcardRouter.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDAddFlashcardRouter: IDBaseRouter, IDAddFlashcardRouterInput {

    func dismiss() {
        self.viewController .dismissViewControllerAnimated(true, completion: nil)
    }
    
}
