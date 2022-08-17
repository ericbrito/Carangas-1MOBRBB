//
//  CarViewControllerTests.swift
//  CarangasTests
//
//  Created by Alves Brito, Eric(AWF) on 16/08/22.
//

import XCTest
@testable import Carangas

class CarViewControllerTests: XCTestCase {
	
	private var sut: CarViewController!
	

    override func setUpWithError() throws {
		try super.setUpWithError()
		sut = CarViewController.instantiateFromStoryboard(.visualization)
    }

    override func tearDownWithError() throws {
		sut = nil
		try super.tearDownWithError()
    }

	func test_viewWillAppear_shouldPrepareViewWithDataFromViewModel() {
		//Given
		sut.viewModel = makeViewModel()
		sut.loadViewIfNeeded()
		
		//When
		//Os métodos abaixo simulam a apresentação de uma controller, ou seja, fazem com que o viewWillAppear e viewDidAppear sejam executados
		sut.beginAppearanceTransition(true, animated: false)
		sut.endAppearanceTransition()
		
		//Then
		XCTAssertEqual(sut.title, "Civic")
		XCTAssertEqual(sut.labelBrand.text, "Marca: Honda")
		XCTAssertEqual(sut.labelPrice.text, "Preço: R$ 250.000,00")
		XCTAssertEqual(sut.labelGasType.text, "Combustível: Flex")
	}
	
	private func makeViewModel() -> CarVisualizationViewModel {
		let car = Car()
		car.brand = "Honda"
		car.name = "Civic"
		car.price = 250000
		car.gasType = 0
		
		let coordinator = CarVisualizationCoordinator(navigationController: UINavigationController(), car: car)
		
		return CarVisualizationViewModel(car: car, coordinator: coordinator)
	}

}
