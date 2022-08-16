//
//  CarsListingViewModelTests.swift
//  CarangasTests
//
//  Created by Alves Brito, Eric(AWF) on 16/08/22.
//

import XCTest
@testable import Carangas

class CarsListingViewModelTests: XCTestCase {

	//SUT: System Under Tests
	
	func test_numberOfRows_shouldReturnNumberOfCars() {
		//Given
		let sut = makeSUT().sut
		
		//When
		let numberOfRows = sut.numberOfRows
		
		//Then
		XCTAssertEqual(numberOfRows, 0)
	}
	
	func test_loadCars_withMockedSuccessResponse_shouldCallServiceOnceAndChangeCarsAndCompleteWithSuccess() {
		//Given
		let (sut, service, _) = makeSUT()
		var returnedResult: (Result<Void, CarServiceError>)?
		
		//When
		sut.loadCars { result in
			returnedResult = result
		}
		
		//Then
		XCTAssertEqual(sut.numberOfRows, 2, "Retornou o total errado de linhas")
		XCTAssertEqual(service.loadCarsCount, 1)
		switch returnedResult {
			case .success:
				break
			default:
				XCTFail("Era esperado um result de .success")
		}
	}
	
	func test_showCarCreation_shouldCallShowCarCreationOnCoordinatorOnce() {
		let (sut, _, coordinator) = makeSUT()
		
		sut.showCarCreation()
		
		XCTAssertEqual(coordinator.showCarCreationCount, 1)
	}
	
	// MARK: - Helpers
	private func makeSUT() -> (sut: CarsListingViewModel, service: CarServiceStub, coordinator: CarsListingCoordinatorSpy) {
		let coordinator = CarsListingCoordinatorSpy()
		let service = CarServiceStub()
		let sut = CarsListingViewModel(service: service, coordinator: coordinator)
		return (sut: sut, service: service, coordinator: coordinator)
	}

}

final class CarsListingCoordinatorSpy: CarListingProtocol {
	var navigationController: UINavigationController = UINavigationController()
	var childCoordinators: [Coordinator] = []
	var parentCoordinator: Coordinator?
	
	var showCarCreationCount: Int = 0
	
	func start() {}
	
	func showCarCreation() {
		showCarCreationCount += 1
	}
	
	func showCar(_ car: Car) {}
	
	
}
