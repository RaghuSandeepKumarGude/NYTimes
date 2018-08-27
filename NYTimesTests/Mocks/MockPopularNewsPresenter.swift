//
//  mockPopularNewsPresenter.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/12/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit
@testable import NYTimes

class MockPopularNewsPresenter: PopularNewsPresentable {
    var view: PopularNewsViewable?
    var model: PopularNewsModalProtocol
    var mostViewedCalled = false
    var selectedArticalCalled = false
    var showSelctedArticalInWebViewCalled = false

    init(view: PopularNewsViewable, model: PopularNewsModalProtocol) {
        self.view = view
        self.model = model
    }

    func mostViewed() {
        mostViewedCalled = true
    }

    func selectedArtical(artical: News?, navigation: UINavigationController) {
        selectedArticalCalled = true
    }

    func showSelctedArticalInWebView(articalUrl: String, navigation: UINavigationController) {
        showSelctedArticalInWebViewCalled = true
    }
}
