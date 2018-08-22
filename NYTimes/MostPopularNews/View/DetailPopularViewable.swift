//
//  DetailPopularViewable.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/11/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation

protocol DetailPopularViewable {
    /**
     * selectedArtical: Contains user selected News artical details
     */
    var selectedArtical: News? { get }

    /**
     *presenter: To give call back to presenter to display selected artical in WkWebView.
     */
    var presenter: PopularNewsPresentable? { get }
}
