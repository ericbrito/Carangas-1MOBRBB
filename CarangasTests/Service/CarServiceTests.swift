//
//  CarServiceTests.swift
//  CarangasTests
//
//  Created by Alves Brito, Eric(AWF) on 16/08/22.
//

import XCTest
@testable import Carangas

class CarServiceTests: XCTestCase {

	private var sut: CarService!
	
    override func setUpWithError() throws {
		try super.setUpWithError()
		sut = CarService()
    }

    override func tearDownWithError() throws {
		sut = nil
		try super.tearDownWithError()
    }
	
	func test_loadCars_responseShouldBeSuccess() {
		//Given
		let expectation = expectation(description: "Success response")
		
		//When
		sut.loadCars { result in
			switch result {
				case .success:
					break
				case .failure(let apiError):
					XCTFail("Serviço falhou. Erro: \(apiError.errorMessage)")
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
}
