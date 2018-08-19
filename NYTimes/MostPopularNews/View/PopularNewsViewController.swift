//
//  PopularNewsViewController.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/8/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import QuartzCore
import SVProgressHUD

class PopularNewsViewController: UIViewController {
    @IBOutlet public weak var tableView: UITableView!
    public var newsFeed: [News]?
    var presenter: PopularNewsPresentable?
    let popularNewsTableViewCellId = "PopularNewsTableViewCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PopularNewsTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: popularNewsTableViewCellId)
        presenter?.mostViewed()
        self.title = "NY Times Most Popular"
        SVProgressHUD.show()
        SVProgressHUD.setBackgroundColor(.darkGray)
        view.isUserInteractionEnabled = false
    }
}

extension PopularNewsViewController: PopularNewsViewable {
    func update(with feed: [News]?) {
        guard let news = feed else {
            // at least show old data, instead of showing the screen with no data
            return
        }

        self.newsFeed = news
        DispatchQueue.main.async { [weak self] in
            SVProgressHUD.dismiss()
            self?.view.isUserInteractionEnabled = true
            self?.tableView.reloadData()
        }
    }

    func showErrorAlert() {
        let alert = UIAlertController(title: "Warring", message: "There is something wrong.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: UITableViewDataSource methods
extension PopularNewsViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeed?.count ?? 0
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: popularNewsTableViewCellId,
                                                 for: indexPath) as? PopularNewsViewContollerCell
        if cell == nil {
            cell = PopularNewsViewContollerCell(style: .default,
                                                reuseIdentifier: popularNewsTableViewCellId)
        }
        cell?.header.text = newsFeed?[indexPath.row].title
        cell?.subHeader.text =  newsFeed?[indexPath.row].byline

        cell?.date.text = newsFeed?[indexPath.row].publishedDate

        if let metaData = newsFeed?[indexPath.row].media?.first?.mediaMetadata?.first(where: {
            $0.format == "Standard Thumbnail"
        }), let imageUrl =  metaData.url {
            cell?.thumbnailImage.sd_setImage(with: URL(string: imageUrl), completed: nil)
        }
        cell?.thumbnailImage.layer.cornerRadius = 30.0
        cell?.thumbnailImage.clipsToBounds = true
        cell?.selectionStyle = .none
        return cell!
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedNews =  newsFeed?[indexPath.row] else {
            return
        }
        presenter?.selectedArtical(artical: selectedNews, navigation: self.navigationController!)
    }
}

extension PopularNewsViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
}
