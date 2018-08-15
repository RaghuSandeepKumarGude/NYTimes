//
//  main.swift
//  NYTimes
//
//  Created by Raghu Sandeep on 8/15/18.
//  Copyright © 2018 Raghu Sandeep. All rights reserved.
//

//let appDelegateClass: AnyClass? =
//    NSClassFromString("NYTimesTests.TestingAppDelegate")?? AppDelegate.self
//let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
//    .bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))
//UIApplicationMain(CommandLine.argc, args, nil, NSStringFromClass(appDelegateClass!))


import UIKit

let test_target = "NYTimesTests"

// if Test Delegate is found, use it otherwise use the default App Delegate
// the Test Delegate is not included as a compile source for the App target
let appDelegateClass: AnyClass? = NSClassFromString("\(test_target).TestingAppDelegate") ?? AppDelegate.self
let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv) .bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))
UIApplicationMain(CommandLine.argc, args, nil, NSStringFromClass(appDelegateClass!))
