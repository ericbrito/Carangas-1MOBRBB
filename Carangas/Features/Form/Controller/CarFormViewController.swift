//
//  CarFormViewController.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 21/06/22.
//

import UIKit

final class CarFormViewController: UIViewController {
	
	@IBOutlet weak var textFieldBrand: UITextField!
	@IBOutlet weak var textFieldName: UITextField!
	@IBOutlet weak var textFieldPrice: UITextField!
	@IBOutlet weak var segmentedControlGasType: UISegmentedControl!
	@IBOutlet weak var buttonSave: UIButton!
	
	var viewModel: CarFormViewModel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = viewModel ?? CarFormViewModel()
		viewModel?.onCarCreated = onCarCreated
		viewModel?.onCarUpdated = onCarUpdated
		
		title = viewModel?.title
		textFieldBrand.text = viewModel?.brand
		textFieldName.text = viewModel?.name
		textFieldPrice.text = viewModel?.price
		segmentedControlGasType.selectedSegmentIndex = viewModel?.gasTypeIndex ?? 0
		buttonSave.setTitle(viewModel?.buttonTitle, for: .normal)
	}
	
	@IBAction func save(_ sender: UIButton) {
		viewModel?.save(name: textFieldName.text!,
						brand: textFieldBrand.text!,
						price: textFieldPrice.text!,
						gasTypeIndex: segmentedControlGasType.selectedSegmentIndex)
	}
	
	private func showResult(_ result: Result<Void, CarServiceError>) {
		switch result {
		case .success:
			DispatchQueue.main.async {
				self.navigationController?.popViewController(animated: true)
			}
		case .failure(let apiError):
			print(apiError.errorMessage)
		}
	}
	
	//MARK: - Injetando closures (MVVM)
	func onCarCreated(result: Result<Void, CarServiceError>) {
		print("Viewmodel avisou que o carro pode ter sido criado!!")
		showResult(result)
	}
	
	func onCarUpdated(result: Result<Void, CarServiceError>) {
		print("Viewmodel avisou que o carro pode ter sido alterado!!")
		showResult(result)
	}
}

/*
//MARK: - Utilizando delegate (MVP)
extension CarFormViewController: CarFormViewModelDelegate {
	func onCarCreated(result: Result<Void, CarServiceError>) {
		print("Viewmodel avisou que o carro pode ter sido criado!!")
		showResult(result)
	}
	
	func onCarUpdated(result: Result<Void, CarServiceError>) {
		print("Viewmodel avisou que o carro pode ter sido alterado!!")
		showResult(result)
	}
}
*/
