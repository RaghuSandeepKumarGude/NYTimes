//
//  MockNewsObject.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/16/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
@testable import NYTimes

struct MockObjects {
    func mockNewsModel() throws -> News? {
        var newsData: Data?
        var feed: News?

        guard let bundlePath = Bundle.main.path(forResource: "sample_response", ofType: "json") else {
            return nil
        }
        do {
            newsData = try String(contentsOfFile: bundlePath, encoding: .utf8).data(using: .utf8)
        }

        do {
            let decoder = JSONDecoder()
            feed = try decoder.decode(News.self, from: newsData!)
        } catch let error {
            print(error.localizedDescription)
        }
        return feed
    }
}
