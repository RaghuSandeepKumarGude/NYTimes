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
    weak var view: PopularNewsViewable?
    var model: PopularNewsModalProtocol

    init(view: PopularNewsViewable, model: PopularNewsModalProtocol) {
        self.view = view
        self.model = model
    }

    func mostViewed() {
        self.model.mostViewed (period: Period.week) { [weak self] (news, error) in
            guard error == nil else {
                self?.view?.showErrorAlert()
                return
            }
            self?.view?.update(with: news)
        }
    }

    func selectedArtical(artical: News?, navigation: UINavigationController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewIdentifier = "DetailPopularNewsViewController"
        let viewContoller = storyboard.instantiateViewController(withIdentifier: detailViewIdentifier)
        guard let newsViewController = viewContoller as? DetailPopularNewsViewController else {
            fatalError("Can't instantiate PopularNewsViewController")
        }
        newsViewController.presenter = self
        newsViewController.selectedArtical = artical
        navigation.pushViewController(newsViewController, animated: true)
    }

    func showSelctedArticalInWebView(articalUrl: String, navigation: UINavigationController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewIdentifier = "DetailWebViewController"
        let viewContoller = storyboard.instantiateViewController(withIdentifier: detailViewIdentifier)
        guard let newsViewController = viewContoller as? DetailWebViewController else {
            fatalError("Can't instantiate PopularNewsViewController")
        }
        newsViewController.selectedArticalUrl = articalUrl
        navigation.pushViewController(newsViewController, animated: true)
    }
}
