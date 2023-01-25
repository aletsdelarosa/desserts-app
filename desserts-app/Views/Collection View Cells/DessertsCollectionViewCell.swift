//
//  DessertsCollectionViewCell.swift
//  desserts-app
//
//  Created by Alets on 1/24/23.
//

import UIKit

class DessertsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(for dessert: Dessert) {
        if let imageUrl = dessert.thumbnailUrl {
            backgroundImageView.load(url: imageUrl, placeholder: nil)
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.clipsToBounds = true
            backgroundImageView.layer.masksToBounds = true
        }
        
        nameLabel.text = dessert.name
        
        backgroundView?.roundAllCorners(radius: 16.0)
        backgroundView?.clipsToBounds = true
        backgroundView?.layer.masksToBounds = true
    }
}
