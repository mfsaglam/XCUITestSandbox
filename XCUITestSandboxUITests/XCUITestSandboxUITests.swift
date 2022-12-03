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

    func testLabelCopiesTextField() {
        let app = XCUIApplication()
        app.launch()
        
        app.textFields.element.tap()

        app.keys["t"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        app.keyboards.buttons["Return"].tap()

        XCTAssertEqual(app.staticTexts["TextCopy"].label, "test")
    }
    
    func testSliderControlsProgress() {
        let app = XCUIApplication()
        app.launch()
        
        app.sliders["Completion"].adjust(toNormalizedSliderPosition: 1)
        
        guard let completion = app.progressIndicators.element.value as? String else {
            XCTFail("Unable to find the progress indicator.")
            return
        }
        
        XCTAssertEqual(completion, "%0")
    }
    
    func testButtonsShowAlerts() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Blue"].tap()
        XCTAssertTrue(app.alerts["Blue"].exists)
        app.alerts["Blue"].buttons["OK"].tap()
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
