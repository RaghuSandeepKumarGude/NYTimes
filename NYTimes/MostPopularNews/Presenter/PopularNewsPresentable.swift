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

    /**
     *view: Contains view reference to update view.
     */
    var view: PopularNewsViewable? { get }

    /**
     *model: Contains model reference to make API call and keep the data updated.
     */
    var model: PopularNewsModalProtocol { get }

    /**
     *mostViewed: Makes API request to fetch most viewed NYTimes Articals for last 7 days.
     */
    func mostViewed()

    /**
     *selectedArtical: Invokes DetailPopularNewsViewController view on selecting any artical.
     *Parameters: Takes selected artical and application navigation.
     */
    func selectedArtical(artical: News?, navigation: UINavigationController)

    /**
     *showSelctedArticalInWebView: Invokes DetailWebViewController
     *Parameters: Takes selected artical's Url and application navigation.
     */
    func showSelctedArticalInWebView(articalUrl: String, navigation: UINavigationController)
}
