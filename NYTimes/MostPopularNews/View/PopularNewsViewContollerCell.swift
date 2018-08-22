//
//  PopularNewsViewContollerCell.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/9/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit

class PopularNewsViewContollerCell: UITableViewCell {

    /**
     *Contains cell thumbnail circular image
     */
    @IBOutlet weak var thumbnailImage: UIImageView!

    /**
     *Artical Title
     */
    @IBOutlet weak var header: UILabel!

    /**
     *Artical description
     */
    @IBOutlet weak var subHeader: UILabel!

    /**
     *Artical published date
     */
    @IBOutlet weak var date: UILabel!
}
