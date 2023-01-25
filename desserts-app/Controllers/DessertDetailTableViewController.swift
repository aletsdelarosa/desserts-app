//
//  DessertDetailTableViewController.swift
//  desserts-app
//
//  Created by Alets on 1/24/23.
//

import UIKit

class DessertDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var dessertImageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingridientsLabel: UILabel!
    
    var dessert: Dessert!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = dessert.name
        
        if let imageUrl = dessert.thumbnailUrl {
            self.dessertImageView.load(url: imageUrl, placeholder: nil)
            self.dessertImageView.contentMode = .scaleAspectFill
            self.dessertImageView.clipsToBounds = true
            self.dessertImageView.layer.masksToBounds = true
        }
        
        self.instructionsLabel.text = dessert.instructions
        self.ingridientsLabel.text = dessert.ingredients?.reduce("") { $0 + $1.getString() }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
}
