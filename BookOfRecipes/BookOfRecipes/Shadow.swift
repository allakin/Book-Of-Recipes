//
//  Shadow.swift
//  BookOfRecipes
//
//  Created by Pavel on 19/02/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import UIKit

extension UIView {
	func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
		layer.masksToBounds = false
		layer.shadowColor = color.cgColor
		layer.shadowOpacity = opacity
		layer.shadowOffset = offSet
		layer.shadowRadius = radius

		layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
		layer.shouldRasterize = true
		layer.rasterizationScale = scale ? UIScreen.main.scale : 1
	}
}
