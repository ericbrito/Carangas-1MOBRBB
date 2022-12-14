//
//  CarFormCoordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 09/08/22.
//

import UIKit

final class CarFormCoordinator: Coordinator {
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []
	var parentCoordinator: Coordinator?
	private var car: Car?
	
	init(navigationController: UINavigationController, car: Car? = nil) {
		self.navigationController = navigationController
		self.car = car
	}
	
	func start() {
		let viewController = CarFormViewController.instantiateFromStoryboard(.form)
		viewController.viewModel = CarFormViewModel(car: car, coordinator: self)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func onSave(result: Result<Void, CarServiceError>) {
		switch result {
			case .success:
				back()
			case .failure(let apiError):
				print("Falha:", apiError.errorMessage)
		}
	}
	
	func back() {
		DispatchQueue.main.async {
			self.navigationController.popViewController(animated: true)
		}
	}
	
	deinit {
		print("CarFormCoordinator deinit")
	}
}
