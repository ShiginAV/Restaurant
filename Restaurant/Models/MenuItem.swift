//
//  MenuItem.swift
//  Restaurant
//
//  Created by Alexander on 30/07/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import Foundation

struct MenuItem: Codable {
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}

extension MenuItem {
    var formattedPrice: String {
        return String(format: "$ %.2f", self.price)
    }
}
