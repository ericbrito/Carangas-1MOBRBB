//
//  CarangasSnapshotTests.swift
//  CarangasSnapshotTests
//
//  Created by Alves Brito, Eric(AWF) on 16/08/22.
//

import XCTest
import iOSSnapshotTestCase
@testable import Carangas

class CarangasSnapshotTests: FBSnapshotTestCase {

	func test_carViewController_snapshot() {
		let sut = makeSUT()
		
//		recordMode = true
		
		FBSnapshotVerifyViewController(sut)
	}
	
	func makeSUT() -> CarViewController {
		let sut = CarViewController.instantiateFromStoryboard(.visualization)
		sut.viewModel = makeViewModel()
		return sut
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
