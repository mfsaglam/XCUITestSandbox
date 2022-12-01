//
//  XCUITestSandboxUITests.swift
//  XCUITestSandboxUITests
//
//  Created by Fatih Sağlam on 30.11.2022.
//  Copyright © 2022 Hacking with Swift. All rights reserved.
//

import XCTest

final class XCUITestSandboxUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        
        app.textFields.element.tap()
        
        app.keys["t"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        app.keyboards.buttons["Return"].tap()
        
        app.sliders["50%"].swipeRight()
        app.segmentedControls.buttons["Omega"].tap()
        app.buttons["Blue"].tap()
        app.alerts["Blue"].buttons["OK"].tap()
        
        /**
        That will pass “enable-testing” to the app when it’s launched, which we can then make it detect and respond to. Our sandbox app doesn’t have any initial state to worry about, but if you needed to configure your app in a certain way then you’d add something like this to your main app:
         
        #if DEBUG
        if CommandLine.arguments.contains("enable-testing") {
            configureAppForTesting()
        }
        #endif
         
        What configureAppForTesting() does is down to you – you might load some fixed data, for example, so that your test stubs work as expected.
        */

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
