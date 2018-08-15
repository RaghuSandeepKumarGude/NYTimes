//
//  MockNewsObject.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/16/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
@testable import NYTimes

class MockNewsObject: News {
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.identifier = 1
        self.url = "https://www.nytimes.com"
        self.title = "NY Times"
        self.byline = "most popular articals"
        self.PublishedDate = "1-1-2018"
        self.media = nil
    }
}

class MockMedia: Media {
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.type = "artical"
        self.subType = "popular"
        self.caption = "NYTimes"
        self.copyRight = "recived"
        self.approvedForSyndication = 2
        self.mediaMetadata = nil
    }
}

class MockMediaMetaData: MediaMetadata {
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.url = "http://www.nyTimes.com"
        self.format = "png"
        self.height = 320
        self.height = 320
    }
}
