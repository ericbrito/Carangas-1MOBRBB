//
//  CarServiceStub.swift
//  CarangasTests
//
//  Created by Alves Brito, Eric(AWF) on 16/08/22.
//

import Foundation
@testable import Carangas

class CarServiceStub: CarServiceProtocol {
	
	var loadCarsCount: Int = 0
	
	func loadCars(onComplete: @escaping (Result<[Car], CarServiceError>) -> Void) {
		let car1 = Car()
		car1.brand = "Ford"
		car1.name = "Ka"
		car1.gasType = 2
		car1.price = 50000
		car1._id = UUID().uuidString

		let car2 = Car()
		car2.brand = "Chevrolet"
		car2.name = "Corvette"
		car2.gasType = 1
		car2.price = 350000
		car2._id = UUID().uuidString

		loadCarsCount += 1
		
		onComplete(.success([car1, car2]))
	}
	
	func deleteCar(_ car: Car, onComplete: @escaping (Result<Void, CarServiceError>) -> Void) {
		
	}
}
