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

        guard let bundlePath = Bundle.main.url(forResource: "sampleResponse",
                                               withExtension: "json") else {
                                                return nil
        }
        do {
            newsData = try Data(contentsOf: bundlePath)
        }

        do {
            let decoder = JSONDecoder()
            print(String(decoding: newsData!, as: UTF8.self))
            feed = try decoder.decode(News.self, from: newsData!)
        } catch let error {
            print(error.localizedDescription)
        }
        return feed
    }
}
