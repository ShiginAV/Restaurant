//
//  Order.swift
//  Restaurant
//
//  Created by Alexander on 30/07/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
