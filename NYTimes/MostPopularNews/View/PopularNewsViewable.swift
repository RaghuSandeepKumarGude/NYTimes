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
    /**
     * presenter: Responsible to fetch data and also performes action on user selection
     */
    var presenter: PopularNewsPresentable? { get }

    /**
     * update: Responsible to update the view, Once presenter fetchs the data from News model
     */
    func update(with feed: [News]?)

    /**
     * showErrorAlert: If any error occuers while fetching data, displaies error alert.
     */
    func showErrorAlert()
}
