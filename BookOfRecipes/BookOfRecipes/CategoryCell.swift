//
//  CategoryCell.swift
//  BookOfRecipes
//
//  Created by Pavel on 06/02/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	private let cellId = "categoryCell"
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Best New Apps"
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = .red
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let dividerLineView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let appsCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 20
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		collectionView.backgroundColor = UIColor.clear
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		return collectionView
	}()
	
	func setupViews() {
		addSubview(appsCollectionView)
		addSubview(dividerLineView)
		addSubview(nameLabel)
		appsCollectionView.delegate = self
		appsCollectionView.dataSource = self
		appsCollectionView.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": nameLabel]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": dividerLineView]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appsCollectionView]))
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel][v0][v1(0.5)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": appsCollectionView, "v1": dividerLineView, "nameLabel": nameLabel]))
		
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 140, height: frame.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 140, bottom: 0, right: 140)
	}
	
}

class CustomCell: UICollectionViewCell {
	
	let imageView: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "img.png")
		image.contentMode = .scaleAspectFill
		image.layer.shadowColor = UIColor(red:0.84, green:0.17, blue:0.38, alpha:1.00).cgColor
		image.layer.shadowOpacity = 0.4
		image.layer.shadowOffset = CGSize(width: 0, height: 6)
		image.layer.shadowRadius = 6
//		image.dropShadow(color: .red, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
		return image
	}()
	
	let descriptionText: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = .black
		label.textAlignment = .left
		label.text = "Привет! Как дела?"
		label.numberOfLines = 2
//		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
//		backgroundColor = .green
		addSubview(imageView)
		addSubview(descriptionText)
		imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 210)
		descriptionText.frame = CGRect(x: 0, y: 220, width: frame.width, height: 40)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

