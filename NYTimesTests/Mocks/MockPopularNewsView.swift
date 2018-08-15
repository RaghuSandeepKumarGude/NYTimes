//
//  MockPopularNewsView.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/13/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit
@testable import NYTimes

class MockPopularNewsView: PopularNewsViewable {
    var presenter: PopularNewsPresentable?
    var updateCalled = false
    var showErrorAlertCalled = false

    public func update(with feed: [News]?) {
        updateCalled = true
    }

    public func showErrorAlert() {
        showErrorAlertCalled = true
    }
}
