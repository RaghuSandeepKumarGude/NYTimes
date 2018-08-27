//
//  MockNavigationContoller.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/28/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit

class MockNavigationController: UINavigationController {
    var navigationStack = [String: [String: Any]]()

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        navigationStack["displayDetailView"] = ["viewController": viewController,
                                                "animated": animated]
        super.pushViewController(viewController, animated: animated)
    }
}
