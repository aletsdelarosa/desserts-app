//
//  Ingredient.swift
//  desserts-app
//
//  Created by Alets on 1/24/23.
//

import Foundation

struct Ingredient: Codable {
    var name: String
    var quantity: String
    
    func getString()-> String {
        return "- \(quantity) \(name)\n"
    }
}
