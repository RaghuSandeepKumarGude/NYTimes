//
//  PopularNewsModelTest.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/13/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import XCTest
@testable import NYTimes
import Foundation

class PopularNewsModelTest: XCTestCase {
    var sut: PopularNewsModal!
    var mockModel: MockPopularNewsApi!

    override func setUp() {
        super.setUp()
        mockModel = MockPopularNewsApi()
        sut = PopularNewsModal(feedService: mockModel)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testMostViewed() {
        sut.mostViewed { (news, error) in
            XCTAssertTrue(self.mockModel.mostViewed)
        }
    }    
}
