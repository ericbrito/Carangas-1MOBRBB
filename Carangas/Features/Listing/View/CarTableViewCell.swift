//
//  CarTableViewCell.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 04/08/22.
//

import UIKit

protocol VehicleViewModel {
	var name: String { get }
	var brand: String { get }
}

final class CarTableViewCell: UITableViewCell {

	func configure(with viewModel: VehicleViewModel) {
		textLabel?.text = viewModel.name
		detailTextLabel?.text = viewModel.brand
	}

}
