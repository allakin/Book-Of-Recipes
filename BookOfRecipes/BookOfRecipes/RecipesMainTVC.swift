//
//  RecipesMainTVC.swift
//  BookOfRecipes
//
//  Created by Pavel on 26/02/2019.
//  Copyright © 2019 Pavel. All rights reserved.
//

import UIKit

class RecipesMainTVC: UITableViewController {
	
	private let tableCellIndetifier = "cell"
	var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return categories[section]
	}
	
	override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		let header = view as! UITableViewHeaderFooterView
		header.backgroundView?.backgroundColor = .white
		header.textLabel?.textColor = .black
		header.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return categories.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIndetifier) as! RecipesMainTVCell
		return cell
	}
	
}
