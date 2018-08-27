//
//  PopularNewsModalProtocol.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

protocol PopularNewsModalProtocol {

    /**
     *presenter: After API call it call back presenter to update the status.
     */

    /**
     *feedService: Helps to make API server call
     */
    var feedService: PopularNewsApiProtocol { get }

    /**
     *news: Contains news model object
     */
    var news: [News]? {get set}

    /**
     *mostViewed: Makes API call, to fetch most viewed NYTimes articals from last 7 days.
     */
    func mostViewed(period: Period, completion: @escaping NewsFeedCompletionHandler)
}
