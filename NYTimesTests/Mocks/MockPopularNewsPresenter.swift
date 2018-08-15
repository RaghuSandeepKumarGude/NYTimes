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

class mockPopularNewsPresenter: PopularNewsPresentable {
    var view: PopularNewsViewable?
    var model: PopularNewsModalProtocol

    init(view: PopularNewsViewable, model: PopularNewsModalProtocol) {
        self.view = view
        self.model = model
    }

    func mostViewed() {

    }

    func selectedArtical(artical: News?, navigation: UINavigationController) {

    }


}
