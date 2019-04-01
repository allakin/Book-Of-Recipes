//
//  CategoryCell.swift
//  BookOfRecipes
//
//  Created by Pavel Anpleenko on 27/03/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
	
	private let cellId = "appCellId"
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Best New Apps"
		label.font = UIFont.systemFont(ofSize: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let appsCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		collectionView.backgroundColor = UIColor.clear
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		return collectionView
	}()
	
	let dividerLineView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	func setupViews() {
		backgroundColor = UIColor.clear
		addSubview(appsCollectionView)
		addSubview(dividerLineView)
		addSubview(nameLabel)
		
		appsCollectionView.dataSource = self
		appsCollectionView.delegate = self
		appsCollectionView.register(RecipesCell.self, forCellWithReuseIdentifier: cellId)
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": dividerLineView]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appsCollectionView, "v1": dividerLineView, "nameLabel": nameLabel]))
		
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 100, height: frame.height - 32)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
	}
	
}


class RecipesCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.image = UIImage(named: "image.jpg")
		iv.contentMode = ContentMode.scaleAspectFill
		iv.layer.cornerRadius = 16
		iv.layer.masksToBounds = true
		return iv
	}()
	
	let nameLabel: UILabel = {
		let text = UILabel()
		text.text = "Название рецепта"
		text.font = UIFont.boldSystemFont(ofSize: 14)
		text.numberOfLines = 2
		return text
	}()
	
	
	func setupUI(){
//		backgroundColor = .black
		addSubview(imageView)
		addSubview(nameLabel)
		imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 100)
		nameLabel.frame = CGRect(x: 0, y: 100, width: frame.width, height: 40)
	}
	
}
