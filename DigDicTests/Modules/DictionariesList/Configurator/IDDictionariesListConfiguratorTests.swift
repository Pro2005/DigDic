//
//  IDDictionariesListIDDictionariesListConfiguratorTests.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import XCTest

class DictionariesListModuleConfiguratorTests: XCTestCase {

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
        let viewController = DictionariesListViewControllerMock()
        let configurator = DictionariesListModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewController)

        //then
        XCTAssertNotNil(viewController.output, "DictionariesListViewController is nil after configuration")
        XCTAssertTrue(viewController.output is DictionariesListPresenter, "output is not DictionariesListPresenter")

        let presenter: DictionariesListPresenter = viewController.output as! DictionariesListPresenter
        XCTAssertNotNil(presenter.view, "view in DictionariesListPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in DictionariesListPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is DictionariesListRouter, "router is not DictionariesListRouter")

        let interactor: DictionariesListInteractor = presenter.interactor as! DictionariesListInteractor
        XCTAssertNotNil(interactor.output, "output in DictionariesListInteractor is nil after configuration")
    }

    class DictionariesListViewControllerMock: DictionariesListViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
