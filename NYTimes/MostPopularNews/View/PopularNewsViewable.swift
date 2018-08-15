//
//  PopularNewsViewable.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit

internal protocol PopularNewsViewable {
    var presenter: PopularNewsPresentable? { get }
    func update(with feed: [News]?)
    func showErrorAlert()
}

