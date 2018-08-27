//
//  PopularNewsApiServiceTest.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/14/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import XCTest
@testable import NYTimes

class PopularNewsApiServiceTest: XCTestCase {
    var sut: PopularNewsApiService!
    var mockSession: MockSessionHelper.MockDataSession!

    override func setUp() {
        super.setUp()
        mockSession = MockSessionHelper.MockDataSession()
        sut = PopularNewsApiService(session: mockSession)
    }

    override func tearDown() {
        mockSession = nil
        sut = nil
        super.tearDown()
    }

    func testMostViewed() {
        let expection = self.expectation(description: "testMostViewed")
        sut.mostViewed(period: Period.week) { _, _ in
            expection.fulfill()
        }
        wait(for: [expection], timeout: 10)
        XCTAssertTrue(mockSession.dataTaskWithUrlCalled)
    }
}
