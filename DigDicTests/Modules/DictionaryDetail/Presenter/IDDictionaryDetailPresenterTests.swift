//
//  IDDictionaryDetailIDDictionaryDetailPresenterTests.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import XCTest

class DictionaryDetailPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: DictionaryDetailInteractorInput {

    }

    class MockRouter: DictionaryDetailRouterInput {

    }

    class MockViewController: DictionaryDetailViewInput {

        func setupInitialState() {

        }
    }
}
