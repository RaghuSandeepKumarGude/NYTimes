//
//  PopularNewsModal.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation


class PopularNewsModal: PopularNewsModalProtocol {
    var feedService: PopularNewsApiProtocol

    var news: [News]?
    
    var presenter: PopularNewsPresentable?

     init(feedService: PopularNewsApiProtocol) {
        self.feedService = feedService
    }

    func mostViewed(completion: @escaping NewsFeedCompletionHandler) {
        feedService.mostViewed(completion: completion)
    }
}
