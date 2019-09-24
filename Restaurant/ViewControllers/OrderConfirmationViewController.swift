//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Alexander on 24/09/2019.
//  Copyright © 2019 Alexander Shigin. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var timeRemainingLabel: UILabel!
    
    //MARK: - Properties
    var minutes: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes"
    }
}
