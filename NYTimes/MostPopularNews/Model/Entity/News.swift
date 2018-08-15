//
//  News.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit

class News: NSObject, Codable {
    var identifier: Int?
    var url: String?
    var title: String?
    var byline: String?
    var PublishedDate: String?
    var media: [Media]?

    enum CodingKeys : String, CodingKey {
        case identifier = "id"
        case url = "url"
        case title = "title"
        case byline = "byline"
        case PublishedDate = "published_date"
        case media = "media"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(identifier, forKey: .identifier)
        try container.encode(url, forKey: .url)
        try container.encode(title, forKey: .title)
        try container.encode(byline, forKey: .byline)
        try container.encode(PublishedDate, forKey: .PublishedDate)
        try container.encode(media, forKey: .media)
    }

    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try values.decode(Int?.self, forKey: .identifier)
        url = try values.decode(String?.self, forKey: .url)
        title = try values.decode(String?.self, forKey: .title)
        byline = try values.decode(String?.self, forKey: .byline)
        PublishedDate = try values.decode(String?.self, forKey: .PublishedDate)
        media = try values.decode([Media]?.self, forKey: .media)
    }
}
