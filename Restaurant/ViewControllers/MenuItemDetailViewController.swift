//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Alexander on 30/07/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailTextLabel: UILabel!
    @IBOutlet var addToOrderButton: UIButton!
    
    //MARK: - Properties
    var menuItem: MenuItem!
    
    //MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addToOrderButton.layer.cornerRadius = 10
        updateUI()
    }
    
    //MARK: - UI Methods
    func updateUI() {
        navigationItem.title = menuItem.formattedPrice
        titleLabel.text = menuItem.name
        detailTextLabel.text = menuItem.detailText
        MenuController.shared.fetchImage(url: menuItem.imageURL) { image in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    //MARK: - IBActions
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            sender.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            sender.transform = CGAffineTransform.identity
        }
        MenuController.shared.order.menuItems.append(menuItem)
    }
}
