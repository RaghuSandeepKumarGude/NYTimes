//
//  MockPopularNewsApi.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/13/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
@testable import NYTimes

class MockPopularNewsApi: NSObject, PopularNewsApiProtocol {
    var popularNewsCalled = false
    var mostViewedCalled = false

    func popularNews(category: MostPopularCategory,
                     section: String,
                     period: Period,
                     completion: @escaping NewsFeedCompletionHandler) {
        popularNewsCalled = true
    }

    func mostViewed(period: Period, completion: @escaping NewsFeedCompletionHandler) {
        mostViewedCalled = true
    }
}
