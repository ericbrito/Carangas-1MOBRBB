//
//  CarVisualizationCoordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 09/08/22.
//

import UIKit

final class CarVisualizationCoordinator: Coordinator {
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []
	var parentCoordinator: Coordinator?
	private var car: Car
	
	init(navigationController: UINavigationController, car: Car) {
		self.navigationController = navigationController
		self.car = car
	}
	
	func start() {
		let viewController = CarViewController.instantiateFromStoryboard(.visualization)
		viewController.viewModel = CarVisualizationViewModel(car: car)
		navigationController.pushViewController(viewController, animated: true)
	}
}
