//
//  AddWordIDAddWordViewOutput.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

protocol IDAddWordViewOutput: IDBaseViewOutput {

    /**
        @author ls
        Notify presenter that view is ready
    */

    func viewIsReady()
    func closePressed()
}
