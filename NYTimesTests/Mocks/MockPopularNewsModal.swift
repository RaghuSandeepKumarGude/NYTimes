//
//  MockPopularNewsModal.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/13/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
@testable import NYTimes

class MockPopularNewsModal: PopularNewsModalProtocol {
    var presenter: PopularNewsPresentable?
    var feedService: PopularNewsApiProtocol
    var news: [News]?
    var mostViewedCalled = false

    init(feedService: PopularNewsApiProtocol) {
        self.feedService = feedService
    }

    func mostViewed(period: Period, completion: @escaping NewsFeedCompletionHandler) {
        mostViewedCalled = true
        completion(nil, nil)
    }
}
