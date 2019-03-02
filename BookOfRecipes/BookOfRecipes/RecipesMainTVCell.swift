//
//  RecipesMainTVCell.swift
//  BookOfRecipes
//
//  Created by Pavel on 26/02/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import UIKit

class RecipesMainTVCell: UITableViewCell {
	private let cellCollectionID = "recipesCell"
	var array = ["img", "img", "img", "img", "img", "img", "img", "img", "img", "img", "img", "img"]
}


extension RecipesMainTVCell : UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 12
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellCollectionID, for: indexPath) as! RecipesCVCell
		cell.layer.cornerRadius = 10
		cell.imageViewRecipes.image = UIImage(named: array[indexPath.row])
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
	}
	
}

extension RecipesMainTVCell : UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let itemsPerRow: CGFloat = 2.2
		let hardCodedPadding: CGFloat = 10
		let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
		let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
		return CGSize(width: itemWidth, height: itemHeight)
	}
	
}
