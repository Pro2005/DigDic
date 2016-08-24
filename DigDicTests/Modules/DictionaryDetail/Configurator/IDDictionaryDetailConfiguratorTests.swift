//
//  IDDictionaryDetailIDDictionaryDetailConfiguratorTests.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import XCTest

class DictionaryDetailModuleConfiguratorTests: XCTestCase {

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
        let viewController = DictionaryDetailViewControllerMock()
        let configurator = DictionaryDetailModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "DictionaryDetailViewController is nil after configuration")
        XCTAssertTrue(viewController.output is DictionaryDetailPresenter, "output is not DictionaryDetailPresenter")

        let presenter: DictionaryDetailPresenter = viewController.output as! DictionaryDetailPresenter
        XCTAssertNotNil(presenter.view, "view in DictionaryDetailPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in DictionaryDetailPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is DictionaryDetailRouter, "router is not DictionaryDetailRouter")

        let interactor: DictionaryDetailInteractor = presenter.interactor as! DictionaryDetailInteractor
        XCTAssertNotNil(interactor.output, "output in DictionaryDetailInteractor is nil after configuration")
    }

    class DictionaryDetailViewControllerMock: DictionaryDetailViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
