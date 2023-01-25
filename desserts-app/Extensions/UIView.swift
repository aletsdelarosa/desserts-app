//
//  UIView.swift
//  desserts-app
//
//  Created by Alets on 1/24/23.
//

import Foundation
import UIKit

extension UIView {
    func roundAllCorners(radius: CGFloat = 8.0) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
