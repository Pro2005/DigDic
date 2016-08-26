//
//  IDAddWordIDAddWordConfiguratorTests.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import XCTest

class AddWordModuleConfiguratorTests: XCTestCase {

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
        let viewController = AddWordViewControllerMock()
        let configurator = AddWordModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "AddWordViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AddWordPresenter, "output is not AddWordPresenter")

        let presenter: AddWordPresenter = viewController.output as! AddWordPresenter
        XCTAssertNotNil(presenter.view, "view in AddWordPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AddWordPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AddWordRouter, "router is not AddWordRouter")

        let interactor: AddWordInteractor = presenter.interactor as! AddWordInteractor
        XCTAssertNotNil(interactor.output, "output in AddWordInteractor is nil after configuration")
    }

    class AddWordViewControllerMock: AddWordViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
