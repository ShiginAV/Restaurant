//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Alexander on 30/07/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    //MARK: - Properties
    let cellManager = CellManager()
    var category: String!
    var menuItems = [MenuItem]()
    var isReloadData = false

    //MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        cellManager.delegate = self
        
        navigationItem.title = category.capitalized
        
        MenuController.shared.fetchMenuItems(forCategory: category) { menuItems in
            guard let menuItems = menuItems else { return }
            self.updateUI(with: menuItems)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MenuItemSegue" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let destination = segue.destination as! MenuItemDetailViewController
        destination.menuItem = self.menuItems[indexPath.row]
    }
    
    //MARK: - UI Methods
    func updateUI(with menuItems: [MenuItem]) {
        self.menuItems = menuItems
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDataSource
extension MenuTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
        let menuItem = menuItems[indexPath.row]
        if !isReloadData {
            cellManager.configure(cell, with: menuItem)
        }
        return cell
    }
}

//MARK: - Reloadable
extension MenuTableViewController: Reloadable {
    func reloadTableViewData() {
        isReloadData = true
        tableView.reloadData()
    }
}
