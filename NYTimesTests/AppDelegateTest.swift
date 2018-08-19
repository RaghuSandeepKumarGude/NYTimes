//
//  AppDelegateTest.swift
//  NYTimesTests
//
//  Created by Raghu Sandeep on 8/12/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

import XCTest
@testable import NYTimes
import UIKit

class AppDelegateTest: XCTestCase {
    var sut: AppDelegate!
    override func setUp() {
        super.setUp()
        sut  = AppDelegate()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testApplicationDidFinishLaunchingWithOptions() {
        let application = UIApplication.shared
        let window = UIWindow(frame: UIScreen.main.bounds)
        sut.window = window

        XCTAssertTrue(sut.application(application,
                                      didFinishLaunchingWithOptions: [:]))

        let view = sut.window?.rootViewController as? UINavigationController
        XCTAssertNotNil(view?.topViewController as? PopularNewsViewController)
    }
}
