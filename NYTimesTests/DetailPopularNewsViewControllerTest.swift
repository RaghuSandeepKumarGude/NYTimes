//
//  DetailPopularNewsViewControllerTest.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/12/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import XCTest
@testable import NYTimes

class DetailPopularNewsViewControllerTest: XCTestCase {

    var sut: DetailPopularNewsViewController!
    var dic: News?

    override func setUp() {
        super.setUp()
        sut = DetailPopularNewsViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testTextViewShouldBeginEditing() {
        let aFrame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 20.0)
        let aTextView = UITextView(frame: aFrame)
        XCTAssertFalse(sut.textViewShouldBeginEditing(aTextView))
    }

    func testViewDidLoad() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardIdentifier = "DetailPopularNewsViewController"
        guard let sut = storyboard.instantiateViewController(withIdentifier: storyBoardIdentifier)
            as? DetailPopularNewsViewController else {
            return XCTFail("Could not load VC from main Story board")
        }
        sut.loadViewIfNeeded()
        let mockNewsDetails = MockObjects()
        sut.selectedArtical = try mockNewsDetails.mockNewsModel()
        sut.viewDidLoad()
        XCTAssertNotNil(sut.articalTitle.text)
    }

    func testToReadMoreSelected() throws {
        let view = MockPopularNewsView()
        let apiProtocol = MockPopularNewsApi()
        let model = MockPopularNewsModal(feedService: apiProtocol)
        let presenter = MockPopularNewsPresenter(view: view,
                                                 model: model)
        sut.selectedArtical = nil
        sut.presenter = presenter

        sut.toReadMoreSelected(sut)

        XCTAssertFalse(presenter.showSelctedArticalInWebViewCalled)
    }
}
