//
//  Media.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

class Media: Codable {
    var type: String?
    var subType: String?
    var caption: String?
    var copyRight: String?
    var approvedForSyndication: Int?
    var mediaMetadata: [MediaMetadata]?

    enum CodingKeys: String, CodingKey {
        case type
        case subType = "subtype"
        case caption = "caption"
        case copyRight = "copyright"
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(subType, forKey: .subType)
        try container.encode(caption, forKey: .caption)
        try container.encode(copyRight, forKey: .copyRight)
        try container.encode(approvedForSyndication, forKey: .approvedForSyndication)
        try container.encode(mediaMetadata, forKey: .mediaMetadata)
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(String?.self, forKey: .type)
        subType = try values.decode(String?.self, forKey: .subType)
        caption = try values.decode(String?.self, forKey: .caption)
        copyRight = try values.decode(String?.self, forKey: .copyRight)
        approvedForSyndication = try values.decode(Int?.self, forKey: .approvedForSyndication)
        mediaMetadata = try values.decode([MediaMetadata]?.self, forKey: .mediaMetadata)
    }
}
