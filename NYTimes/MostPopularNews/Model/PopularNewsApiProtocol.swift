//
//  PopularNewsApiProtocol.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

/**
 *Values*

 `mostEmailed` NYTimes most emailed articals

 `mostShared` NYTimes most shared articals

 `mostViewed` NYTimes most viewed articals

 - Author:
 MostPopularCategory
 */
enum MostPopularCategory: String {
    case mostEmailed = "mostemailed"
    case mostShared = "mostshared"
    case mostViewed = "mostviewed"
}

/**
 *Values*

 `today` It contains value 1

 `week` It contains value 7

 `month` It contains value 30

 - Author:
 Period
 */
enum Period: Int {
    case today = 1
    case week = 7
    case month = 30
}

typealias  NewsFeedCompletionHandler = ([News]?, Error?) -> Void

protocol PopularNewsApiProtocol {

    /**
     * Makes Api based on given inputs.
     * -Parameters:
     *Category: Imput is MostPopularCategory enum value
     *section: Taken all-sections
     *period: Imput is Period enum value
     */
    func popularNews(category: MostPopularCategory,
                     section: String,
                     period: Period,
                     completion: @escaping NewsFeedCompletionHandler)

    /**
     * mostViewed calls popularNews and give call back.
     */
    func mostViewed(completion: @escaping NewsFeedCompletionHandler)
}
