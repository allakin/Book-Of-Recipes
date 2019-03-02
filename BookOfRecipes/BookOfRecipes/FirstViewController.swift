//
//  FirstViewController.swift
//  BookOfRecipes
//
//  Created by Pavel on 03/02/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import UIKit

class FirstViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	private let cellId = "cell"
	
	override func viewDidLoad() {
		super.viewDidLoad()
//		collectionView.backgroundColor = .red
		collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.height, height: 290)
	}
}


