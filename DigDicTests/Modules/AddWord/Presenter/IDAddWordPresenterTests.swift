//
//  IDAddFlashcardIDAddFlashcardPresenterTests.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import XCTest

class AddFlashcardPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: AddFlashcardInteractorInput {

    }

    class MockRouter: AddFlashcardRouterInput {

    }

    class MockViewController: AddFlashcardViewInput {

        func setupInitialState() {

        }
    }
}
