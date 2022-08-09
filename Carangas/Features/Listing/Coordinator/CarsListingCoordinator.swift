//
//  CarsListingCoordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 09/08/22.
//

import UIKit

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
