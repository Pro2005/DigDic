//
//  AddWordIDAddWordRouter.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDAddWordRouter: IDBaseRouter, IDAddWordRouterInput {

    func dismiss() {
        self.viewController .dismissViewControllerAnimated(true, completion: nil)
    }
    
}
