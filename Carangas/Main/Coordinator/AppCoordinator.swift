//
//  AppCoordinator.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 09/08/22.
//

import UIKit

final class AppCoordinator: Coordinator {
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []
	var parentCoordinator: Coordinator?
	
	init() {
		navigationController = UINavigationController()
		navigationController.navigationBar.prefersLargeTitles = true
	}
	
	func start() {
		let childCoordinator = CarsListingCoordinator(navigationController: navigationController)
		add(childCoordinator: childCoordinator)
		childCoordinator.parentCoordinator = self
		childCoordinator.start()
	}
}
