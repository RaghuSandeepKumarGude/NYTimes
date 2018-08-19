//
//  PopularNewsModalProtocol.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

protocol PopularNewsModalProtocol {
    var presenter: PopularNewsPresentable? { get }
    var feedService: PopularNewsApiProtocol { get }
    var news: [News]? {get set}

    func mostViewed(completion: @escaping NewsFeedCompletionHandler)
}
