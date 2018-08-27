//
//  PopularNewsApiService.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

enum FeedError: Error {
    case invalidUrl
    case noResultsFound
}

class PopularNewsApiService: PopularNewsApiProtocol {

    let baseUrl = "http://api.nytimes.com/svc/mostpopular/v2/"
    let apiKey = "a4bd1ee11a764e3d8479472dc4439b9e"
    private var session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    convenience init () {
        self.init(session: URLSession(configuration: .default))
    }

    func popularNews(category: MostPopularCategory,
                     section: String,
                     period: Period,
                     completion: @escaping NewsFeedCompletionHandler) {

        let popularNYNews = "\(baseUrl)\(category.rawValue)/\(section)/\(period.rawValue).json?api-key=\(apiKey)"
        guard let popularNYNewsurl = URL(string: popularNYNews) else {
            completion(nil, FeedError.invalidUrl)
            return
        }

        let task =  session.dataTask(with: popularNYNewsurl) { (data, _, error) in
            guard let responseData = data, error == nil else {
                completion(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let feed = try decoder.decode(NewsFeed.self, from: responseData)
                completion(feed.results, nil)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    func mostViewed(period: Period, completion: @escaping NewsFeedCompletionHandler) {
        popularNews(category: MostPopularCategory.mostViewed,
                    section: "all-sections",
                    period: period,
                    completion: completion)
    }
}
