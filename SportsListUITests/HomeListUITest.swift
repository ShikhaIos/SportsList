//
//  HomeListUITest.swift
//
//  Created by shikha on 08/03/22.
//

import XCTest

class HomeListUITest: XCTestCase {
    
    func test_should_make_sure_controls_have_default_value()
    {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        let button = app.buttons["viewSportsListButton"]
        XCTAssertEqual(button.label, "View Sports List")
    }

}
