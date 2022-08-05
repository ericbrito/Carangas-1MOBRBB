//
//  CarFormViewModel.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 04/08/22.
//

import Foundation

/*
protocol CarFormViewModelDelegate: AnyObject {
	func onCarCreated(result: Result<Void, CarServiceError>)
	func onCarUpdated(result: Result<Void, CarServiceError>)
}
*/

final class CarFormViewModel {
	private var car: Car
	private let service = CarService()
	
	//weak var delegate: CarFormViewModelDelegate?
	var onCarCreated: ((Result<Void, CarServiceError>) -> Void)?
	var onCarUpdated: ((Result<Void, CarServiceError>) -> Void)?
	
	
	private var isEditing: Bool {
		car._id != nil
	}
	
	init(car: Car? = nil) {
		self.car = car ?? Car()
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
				//self?.delegate?.onCarCreated(result: result)
				self?.onCarCreated?(result)
			}
		} else {
			service.updateCar(car) { [weak self] result in
				//self?.delegate?.onCarUpdated(result: result)
				self?.onCarUpdated?(result)
			}
		}
	}
}
