//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Alexander on 30/07/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    //MARK: - Properties
    let cellManager = CellManager()
    var categories = [String]()

    //MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        MenuController.shared.fetchCategories { categories in
            guard let categories = categories else { return }
            self.updateUI(with: categories)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MenuSegue" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let destination = segue.destination as! MenuTableViewController
        destination.category = self.categories[indexPath.row]
    }
    
    @IBAction func unwindToCategorys(_ unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "DismissConfirmation" else { return }
        MenuController.shared.order.menuItems.removeAll()
    }
    
    //MARK: - UI Methods
    func updateUI(with categories: [String]) {
        self.categories = categories
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDataSource
extension CategoryTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cellManager.configure(cell, with: categories[indexPath.row])
        return cell
    }
}
