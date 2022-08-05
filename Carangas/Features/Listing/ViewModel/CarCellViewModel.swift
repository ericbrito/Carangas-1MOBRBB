//
//  CarCellViewModel.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 04/08/22.
//

import Foundation

final class CarCellViewModel: VehicleViewModel {
	private var car: Car
	
	init(car: Car) {
		self.car = car
	}
	
	var name: String {
		car.name
	}
	
	var brand: String {
		car.brand
	}
}
