//
//  NewsFeed.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/9/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

class NewsFeed: Codable {
    var status: String?
    var results: [News]?
    var copyRight: String?
    var numOfResults: Int?

    enum CodingKeys: String, CodingKey {
        case status
        case results
        case copyRight = "copyright"
        case numOfResults = "num_results"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
        try container.encode(results, forKey: .results)
        try container.encode(copyRight, forKey: .copyRight)
        try container.encode(numOfResults, forKey: .numOfResults)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decode(String.self, forKey: .status)
        results = try values.decode([News]?.self, forKey: .results)
        copyRight = try values.decode(String?.self, forKey: .copyRight)
        numOfResults = try values.decode(Int?.self, forKey: .numOfResults)
    }
}
