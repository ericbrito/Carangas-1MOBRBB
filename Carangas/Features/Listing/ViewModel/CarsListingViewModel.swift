//
//  CarsListingViewModel.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 04/08/22.
//

import Foundation

typealias CarListingProtocol = ShowCarProtocol & CreateCarProtocol & Coordinator

final class CarsListingViewModel {
	private var service = CarService()
	private var cars: [Car] = []
	
	//Dependency Injection
	
	//Property Injection
	private weak var coordinator: CarListingProtocol?
	
	//Constructor Injection
	init(coordinator: CarsListingCoordinator) {
		self.coordinator = coordinator
	}
	
	var numberOfRows: Int {
		cars.count
	}

	func loadCars(onComplete: @escaping (Result<Void, CarServiceError>) -> Void) {
		service.loadCars { [weak self] result in  //<- //Capture List
			switch result {
				case .success(let cars):
					self?.cars = cars
					onComplete(.success(()))
				case .failure(let apiError):
					onComplete(.failure(apiError))
			}
		}
	}
	
	func cellViewModelFor(_ indexPath: IndexPath) -> VehicleViewModel {
		let car = cars[indexPath.row]
		return CarCellViewModel(car: car)
	}
	
	func deleteCar(at indexPath: IndexPath, onComplete: @escaping (Result<Void, CarServiceError>) -> Void) {
		let car = cars[indexPath.row]
		service.deleteCar(car) { [weak self] result in
			switch result {
			case .success:
				self?.cars.remove(at: indexPath.row)
				onComplete(.success(()))
			case .failure(let apiError):
				onComplete(.failure(apiError))
			}
		}
	}
	
	func showCarAt(_ indexPath: IndexPath) {
		let car = cars[indexPath.row]
		coordinator?.showCar(car)
	}
	
	func showCarCreation() {
		coordinator?.showCarCreation()
	}
}


