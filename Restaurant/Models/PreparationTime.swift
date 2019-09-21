//
//  PreparationTime.swift
//  Restaurant
//
//  Created by Alexander on 30/07/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
