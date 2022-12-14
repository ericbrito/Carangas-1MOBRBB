//
//  CarsListingCoordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 09/08/22.
//

import UIKit

protocol ShowCarProtocol {
	func showCar(_ car: Car)
}

protocol CreateCarProtocol {
	func showCarCreation()
}

final class CarsListingCoordinator: Coordinator {
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []
	var parentCoordinator: Coordinator?
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let viewController = CarsTableViewController.instantiateFromStoryboard(.listing)
		viewController.viewModel = CarsListingViewModel(coordinator: self)
		navigationController.pushViewController(viewController, animated: false)
	}
}

extension CarsListingCoordinator: ShowCarProtocol {
	func showCar(_ car: Car) {
		let childCoordinator = CarVisualizationCoordinator(navigationController: navigationController, car: car)
		add(childCoordinator: childCoordinator)
		childCoordinator.parentCoordinator = self
		childCoordinator.start()
	}
}

extension CarsListingCoordinator: CreateCarProtocol {
	func showCarCreation() {
		let childCoordinator = CarFormCoordinator(navigationController: navigationController)
		add(childCoordinator: childCoordinator)
		childCoordinator.parentCoordinator = self
		childCoordinator.start()
	}
}
