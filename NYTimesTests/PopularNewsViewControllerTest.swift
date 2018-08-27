//
//  PopularNewsViewControllerTest.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/13/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import XCTest
@testable import NYTimes
import Foundation
import SVProgressHUD

class PopularNewsViewControllerTest: XCTestCase {
    var sut: PopularNewsViewController!
    var tableView: MockUITableView!

    override func setUp() {
        super.setUp()
        tableView = MockUITableView()
        sut = PopularNewsViewController()
        sut.tableView = tableView
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewDidLoad() {
        sut.viewDidLoad()

        XCTAssertEqual("NY Times Most Popular", sut.title)
        XCTAssertFalse(sut.view.isUserInteractionEnabled)
    }

    func testupdate() throws {
        sut.view = UIView()
        let mockNewsDetails = MockObjects()
        let mockNews = try mockNewsDetails.mockNewsModel()

        sut.update(with: [mockNews!])

        XCTAssertTrue(sut.view.isUserInteractionEnabled)
    }

    func testHeightForRowAt() {
        let indexPath = IndexPath(row: 0, section: 0)

        XCTAssertEqual(130, sut.tableView(tableView, heightForRowAt: indexPath))
    }

    func testNumberOfRowsInSection() {
        let indexPath = IndexPath(row: 0, section: 0)
        sut.newsFeed = nil

        XCTAssertEqual(0, sut.tableView(tableView, numberOfRowsInSection: indexPath.section))
    }

    func testCellForAtIndexPath() {
        let indexPath = IndexPath(row: 0, section: 0)
        let tableView = UITableView()
        let currentPlanCellId = "PopularNewsTableViewCellId"
        let cellNibName = "PopularNewsTableViewCell"
        let nib = UINib(nibName: cellNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: currentPlanCellId)

        XCTAssertNotNil(sut.tableView(tableView, cellForRowAt: indexPath))
    }

    func testDidSelectRow() {
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(tableView, didSelectRowAt: indexPath)
    }
}
