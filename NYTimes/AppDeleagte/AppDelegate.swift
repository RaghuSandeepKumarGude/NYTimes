//
//  AppDelegate.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navigation = UINavigationController(rootViewController: rootViewController())
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

    // MARK: Set up
    private func rootViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let newsViewController = storyboard.instantiateViewController(withIdentifier: "PopularNewsViewController") as? PopularNewsViewController else {
            fatalError("Can't instantiate PopularNewsViewController")
        }
        let apiService = PopularNewsApiService()
        let model = PopularNewsModal(feedService: apiService)
        let presenter = PopularNewsPresenter(view: newsViewController, model: model)
        newsViewController.presenter = presenter
        return newsViewController
    }
}

