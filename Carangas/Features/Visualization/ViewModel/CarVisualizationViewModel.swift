//
//  CarVisualizationViewModel.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 04/08/22.
// Teste

import Foundation
protocol VisualizationViewModelProtocol {
	var title: String { get }
	var brand: String { get }
	var gasType: String { get }
	var price: String { get }
	func getCarFormViewModel() -> CarFormViewModel
	func showForm()
}

final class CarVisualizationViewModel: VisualizationViewModelProtocol {
	
	private var car: Car
	private let numberFormatter: NumberFormatter = {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .currency
		numberFormatter.locale = Locale(identifier: "pt_BR")
		return numberFormatter
	}()
	private weak var coordinator: CarVisualizationCoordinator?
	
	init(car: Car, coordinator: CarVisualizationCoordinator) {
		self.car = car
		self.coordinator = coordinator
	}
	
	var title: String {
		car.name
	}
	
	var brand: String {
		"Marca: \(car.brand)"
	}
	
	var gasType: String {
		"Combustível: \(car.fuel)"
	}
	
	var price: String {
		let price = numberFormatter.string(from: NSNumber(value: car.price)) ?? "R$ \(car.price),00"
		return "Preço: \(price)"
	}
	
	func getCarFormViewModel() -> CarFormViewModel {
		CarFormViewModel(car: car)
	}
	
	func showForm() {
		coordinator?.showForm()
	}
}
