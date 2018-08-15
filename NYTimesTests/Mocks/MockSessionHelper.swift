//
//  MockSessionHelper.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/13/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

struct MockSessionHelper {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

    class MockDataSession: URLSession {
        var requestUrl: URL?
        var error: NSError?
        var response: URLResponse?
        var handler: CompletionHandler?
        var data: Data?
        var dataTaskWithUrlCalled = false

        init(url: URL? = nil,
             urlResponse: URLResponse? = nil,
             data: Data? = nil,
             error: NSError? = nil) {
            self.requestUrl = url
            self.error = error
            self.response = urlResponse
            self.data = data
        }

        override func dataTask(with url: URL,
                               completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            handler = completionHandler
            requestUrl = url
            dataTaskWithUrlCalled = true
            return MockDataTask(data: data,
                                urlResponse: response,
                                httpError: error,
                                completionHandler: completionHandler)
        }
    }

    class MockDataTask: URLSessionDataTask {
        let data: Data?
        let urlResponse: URLResponse?
        let httpError: NSError?
        let block: CompletionHandler?

        init(data: Data?,
             urlResponse: URLResponse?,
             httpError: NSError?,
             completionHandler: CompletionHandler? = nil) {
            self.data = data
            self.urlResponse = urlResponse
            self.httpError = httpError
            self.block = completionHandler
        }

        override func resume() {
            block?(data, urlResponse, httpError)
        }
    }
}

