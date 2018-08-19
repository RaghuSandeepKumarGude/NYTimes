//
//  PopularNewsPresenterTest.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/12/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import XCTest
@testable import NYTimes

class PopularNewsPresenterTest: XCTestCase {
    var sut: PopularNewsPresenter!
    var mockView: MockPopularNewsView!
    var mockNewsApi: MockPopularNewsApi!
    var mockNewsModel: MockPopularNewsModal!

    private class MockNavigationController: UINavigationController {
        var navigationStack = [String: [String: Any]]()

        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            navigationStack["displayDetailView"] = ["viewController": viewController, "animated": animated]
        }
    }

    override func setUp() {
        super.setUp()
        let mockView = MockPopularNewsView()
        let mockNewsApi = MockPopularNewsApi()
        mockNewsModel = MockPopularNewsModal(feedService: mockNewsApi)
        sut = PopularNewsPresenter(view: mockView, model: mockNewsModel)
        mockNewsModel.presenter = sut
        mockView.presenter = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testMostViewed() {
        sut.mostViewed()
        XCTAssertTrue(mockNewsModel.mostViewedCalled)
    }

    func testSelectedArtical() {
        let mockNavigation = MockNavigationController()
        sut.selectedArtical(artical: nil, navigation: mockNavigation)

        if let navigationstack = mockNavigation.navigationStack["displayDetailView"] {
            let view = navigationstack["viewController"] as? DetailPopularNewsViewController
            XCTAssertNotNil(view)
        }
    }
}
