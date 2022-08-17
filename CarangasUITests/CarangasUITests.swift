//
//  CarangasUITests.swift
//  CarangasUITests
//
//  Created by Alves Brito, Eric(AWF) on 16/08/22.
//

import XCTest

class CarangasUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func test_whenTapACellOnListingScreen_shouldGoToVisualizationScreen() {
		
		let app = XCUIApplication()
		app.launch()

		let cell = app.tables.firstMatch.cells.firstMatch
		XCTAssertTrue(cell.waitForExistence(timeout: 3.0))
		
		let cellTitleLabelText = cell.staticTexts["carCellTitle"].label
		
		cell.tap()
		
		XCTAssertTrue(app.navigationBars[cellTitleLabelText].exists, "Tela errada")
	}
	
	func test_whenTapAddOnListingScreen_shouldGoToFormScreen() {
		
		let app = XCUIApplication()
		app.launch()
		
		let carangasNavigationBar = app.navigationBars["Carangas"]
		carangasNavigationBar.buttons["Add"].tap()
		
		let formNavigationBar = app.navigationBars["Cadastro"]
		XCTAssertTrue(formNavigationBar.exists, "Tela errada")
	}
}
