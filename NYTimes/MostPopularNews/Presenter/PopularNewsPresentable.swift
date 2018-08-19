//
//  PopularNewsPresentable.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit

protocol PopularNewsPresentable {
    var view: PopularNewsViewable? { get }
    var model: PopularNewsModalProtocol { get }
    func mostViewed()
    func selectedArtical(artical: News?, navigation: UINavigationController)
    func showSelctedArticalInWebView(articalUrl: String, navigation: UINavigationController)
}
