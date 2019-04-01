//
//  FeaturedRecipesController.swift
//  BookOfRecipes
//
//  Created by Pavel Anpleenko on 26/03/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import UIKit

class FeaturedRecipesController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	private let cellId = "cellId"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.backgroundColor = UIColor.white
		collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: 200)
	}
	
}
