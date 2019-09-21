//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Alexander on 30/07/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    let menuController = MenuController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var order = Order()
        menuController.fetchCategories { categories in
            guard let categories = categories else { return }
            for category in categories {
                self.menuController.fetchMenuItems(forCategory: category, completion: { menuItems in
                    menuItems?.forEach { order.menuItems.append($0) }
                    print("\n", category)
                    print(menuItems ?? "nil")
                    menuItems?.forEach {
                        self.menuController.fetchImage(url: $0.imageURL, completion: { image in
                            print(image ?? "nil")
                        })
                    }
                })
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.menuController.submitOrder(forMenuIDs: order.menuItems.map { $0.id } , completion: { minutes in
                print("Wait time = ", minutes ?? "nil")
            })
        }
    }
}
