//
//  CarFormViewModel.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 04/08/22.
//

import Foundation


final class CarFormViewModel {
	private var car: Car
	private let service = CarService()
	private weak var coordinator: CarFormCoordinator?
	
	private var isEditing: Bool {
		car._id != nil
	}
	
	init(car: Car? = nil, coordinator: CarFormCoordinator) {
		self.car = car ?? Car()
		self.coordinator = coordinator
	}
	
	var title: String {
		isEditing ? "Atualização" : "Cadastro"
	}
	
	var brand: String {
		car.brand
	}
	
	var name: String {
		car.name
	}
	
	var price: String {
		"\(car.price)"
	}
	
	var gasTypeIndex: Int {
		car.gasType
	}
	
	var buttonTitle: String {
		isEditing ? "Atualizar carro" : "Cadastrar carro"
	}
	
	func save(name: String, brand: String, price: String, gasTypeIndex: Int) {
		car.name = name
		car.brand = brand
		car.price = Int(price) ?? 0
		car.gasType = gasTypeIndex
		
		if !isEditing {
			service.createCar(car) { [weak self] result in
				self?.coordinator?.onSave(result: result)
			}
		} else {
			service.updateCar(car) { [weak self] result in
				self?.coordinator?.onSave(result: result)
			}
		}
	}
	
	deinit {
		print("CarFormViewModel deinit")
		coordinator?.childDidFinish(nil)
	}
}
