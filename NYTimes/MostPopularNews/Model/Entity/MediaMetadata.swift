//
//  MediaMetadata.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

class MediaMetadata: Codable {
    var url: String?
    var format: String?
    var height: Int?
    var width: Int?

    enum CodingKeys: String, CodingKey {
        case url
        case format
        case height
        case width
    }

    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(format, forKey: .format)
        try container.encode(height, forKey: .height)
        try container.encode(width, forKey: .width)
    }

    required init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decode(String?.self, forKey: .url)
        format = try values.decode(String?.self, forKey: .format)
        height = try values.decode(Int?.self, forKey: .height)
        width = try values.decode(Int?.self, forKey: .width)
    }
}
