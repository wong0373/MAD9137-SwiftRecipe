//
//  MAD9137_iosApp1_RecipeAssignmentUITestsLaunchTests.swift
//  MAD9137_iosApp1_RecipeAssignmentUITests
//
//  Created by Terry Wong on 30/10/2024.
//

import XCTest

final class MAD9137_iosApp1_RecipeAssignmentUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
