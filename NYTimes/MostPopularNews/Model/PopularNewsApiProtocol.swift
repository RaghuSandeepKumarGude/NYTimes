//
//  PopularNewsApiProtocol.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

enum MostPopularCategory: String {
    case mostEmailed = "mostemailed"
    case mostShared = "mostshared"
    case mostViewed = "mostviewed"
}

enum Period: Int {
    case today = 1
    case week = 7
    case month = 30
}

typealias  NewsFeedCompletionHandler = ([News]?, Error?) -> Void

protocol PopularNewsApiProtocol {
    func popularNews(category: MostPopularCategory,
                     section: String,
                     period: Period,
                     completion: @escaping NewsFeedCompletionHandler)
    func mostViewed(completion: @escaping NewsFeedCompletionHandler)
}
