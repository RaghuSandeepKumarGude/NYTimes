//
//  DetailWebViewController.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/19/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class DetailWebViewController: UIViewController, WKNavigationDelegate, DetailWebViewViewable {
    var selectedArticalUrl: String?
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = NSURL(string: selectedArticalUrl!) else {
            return
        }
        let request = URLRequest(url: url as URL)
        webView.navigationDelegate = self
        webView.load(request)
        SVProgressHUD.show()
        SVProgressHUD.setBackgroundColor(.darkGray)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        SVProgressHUD.show()
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
        SVProgressHUD.dismiss()
    }
}
