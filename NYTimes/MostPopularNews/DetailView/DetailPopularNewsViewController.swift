//
//  DetailPopularNewsViewController.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/11/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit

class DetailPopularNewsViewController: UIViewController, DetailPopularViewable {
    public var selectedArtical: News?
    var presenter: PopularNewsPresentable?
    @IBOutlet weak var articalImage: UIImageView!
    @IBOutlet weak var articalTitle: UILabel!
    @IBOutlet weak var articalAuthor: UILabel!
    @IBOutlet weak var articalPulishedDate: UILabel!
    @IBOutlet weak var articalCaption: UITextView!
    var aticalDescription: String?

    @IBOutlet weak var toReadMore: UIButton!
    override public func viewDidLoad() {
        articalTitle.text = selectedArtical?.title

        if let metaData = selectedArtical?.media?.first?.mediaMetadata?.first(where: {
            $0.format == "Large"
        }), let imageUrl = metaData.url {
            articalImage.sd_setImage(with: URL(string: imageUrl), completed: nil)
        } else {
            articalImage.image = UIImage(named: "defaultArticalImage")
        }
        articalAuthor.text = selectedArtical?.byline
        articalPulishedDate.text = selectedArtical?.publishedDate
        articalCaption.text = selectedArtical?.media?.first?.caption
        articalCaption.delegate = self
    }

    @IBAction public func toReadMoreSelected(_ sender: Any) {
        presenter?.showSelctedArticalInWebView(articalUrl: (selectedArtical?.url)!,
                                               navigation: self.navigationController!)
    }
}

extension DetailPopularNewsViewController: UITextViewDelegate {
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }
}
