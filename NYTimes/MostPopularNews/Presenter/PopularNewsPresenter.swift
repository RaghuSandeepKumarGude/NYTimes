//
//  PopularNewsPresenter.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import  UIKit

class PopularNewsPresenter: PopularNewsPresentable {
    var view: PopularNewsViewable?
    var model: PopularNewsModalProtocol

    init(view: PopularNewsViewable, model: PopularNewsModalProtocol) {
        self.view = view
        self.model = model
    }

    func mostViewed() {
        self.model.mostViewed { (news, error) in
            guard error == nil else {
                self.view?.showErrorAlert()
                return
            }
            self.view?.update(with: news)
        }
    }

    func selectedArtical(artical: News?, navigation: UINavigationController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let newsViewController = storyboard.instantiateViewController(withIdentifier: "DetailPopularNewsViewController") as? DetailPopularNewsViewController else {
            fatalError("Can't instantiate PopularNewsViewController")
        }
        newsViewController.selectedArtical = artical
        navigation.pushViewController(newsViewController, animated: true)
    }
}
