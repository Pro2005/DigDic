//
//  IDAddFlashcardIDAddFlashcardConfiguratorTests.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import XCTest

class AddFlashcardModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = AddFlashcardViewControllerMock()
        let configurator = AddFlashcardModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "AddFlashcardViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AddFlashcardPresenter, "output is not AddFlashcardPresenter")

        let presenter: AddFlashcardPresenter = viewController.output as! AddFlashcardPresenter
        XCTAssertNotNil(presenter.view, "view in AddFlashcardPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AddFlashcardPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AddFlashcardRouter, "router is not AddFlashcardRouter")

        let interactor: AddFlashcardInteractor = presenter.interactor as! AddFlashcardInteractor
        XCTAssertNotNil(interactor.output, "output in AddFlashcardInteractor is nil after configuration")
    }

    class AddFlashcardViewControllerMock: AddFlashcardViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
