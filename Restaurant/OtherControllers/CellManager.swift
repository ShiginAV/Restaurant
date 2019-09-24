//
//  CellManager.swift
//  Restaurant
//
//  Created by Alexander on 21/09/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import UIKit

class CellManager {
    var delegate: Reloadable?
    
    func configure(_ cell: UITableViewCell, with category: String) {
        cell.textLabel?.text = category.capitalized
    }
    
    func configure(_ cell: UITableViewCell, with menuItem: MenuItem) {
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = menuItem.formattedPrice
        
        MenuController.shared.fetchImage(url: menuItem.imageURL) { image in
            DispatchQueue.main.async {
                cell.imageView?.image = image
                self.delegate?.reloadTableViewData()
            }
        }
    }
}
