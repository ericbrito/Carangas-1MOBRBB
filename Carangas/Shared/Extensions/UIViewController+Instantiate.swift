//
//  UIViewController+Instantiate.swift
//  Carangas
//
//  Created by Alves Brito, Eric(AWF) on 09/08/22.
//

import UIKit

extension UIViewController {
	static func instantiateFromStoryboard(_ storyboard: UIStoryboard) -> Self {
		let name = String(describing: self)
		return storyboard.instantiateViewController(withIdentifier: name) as! Self
	}
}
