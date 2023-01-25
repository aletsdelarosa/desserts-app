//
//  Dessert.swift
//  desserts-app
//
//  Created by Alets on 1/24/23.
//

import Foundation

class Dessert: Decodable {
    var id: Int
    var name: String
    var drinkAlternate: String?
    var area: String?
    var instructions: String?
    var thumbnailUrl: URL?
    var tags: String?
    var youtubeUrl: URL?
    var ingredients: [Ingredient]?
    var sourceUrl: URL?
    var imageSourceUrl: URL?
    var creativeCommonsConfirmed: Bool?
    var dateModified: Date?
    var containsAllData = false
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnailUrl = "strMealThumb"
        case tags = "strTags"
        case youtubeUrl = "strYoutube"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
        case sourceUrl = "strSource"
        case imageSourceUrl = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let idString = try container.decode(String.self, forKey: .id)
        id = Int(idString)!
        name = try container.decode(String.self, forKey: .name)
        drinkAlternate = try? container.decodeIfPresent(String.self, forKey: .drinkAlternate)
        area = try? container.decodeIfPresent(String.self, forKey: .area)
        instructions = try? container.decodeIfPresent(String.self, forKey: .instructions)?.replacingOccurrences(of: "\n", with: "\n\n")
        thumbnailUrl = try? container.decode(URL.self, forKey: .thumbnailUrl)
        tags = try? container.decodeIfPresent(String.self, forKey: .tags)
        youtubeUrl = try? container.decodeIfPresent(URL.self, forKey: .youtubeUrl)
        sourceUrl = try? container.decodeIfPresent(URL.self, forKey: .sourceUrl)
        imageSourceUrl = try? container.decodeIfPresent(URL.self, forKey: .imageSourceUrl)
        creativeCommonsConfirmed = try? container.decodeIfPresent(Bool.self, forKey: .creativeCommonsConfirmed)
        dateModified = try? container.decodeIfPresent(Date.self, forKey: .dateModified)
        
        ingredients = [Ingredient]()
        
        if let ingredient1 = try? container.decodeIfPresent(String.self, forKey: .ingredient1)?.trimmingCharacters(in: .whitespacesAndNewlines),
           let measure1 = try? container.decodeIfPresent(String.self, forKey: .measure1)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient1.isEmpty {
            ingredients?.append(Ingredient(name: ingredient1, quantity: measure1))
        }
        
        if let ingredient2 = try? container.decodeIfPresent(String.self, forKey: .ingredient2)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure2 = try? container.decodeIfPresent(String.self, forKey: .measure2)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient2.isEmpty {
            ingredients?.append(Ingredient(name: ingredient2, quantity: measure2))
        }
        
        if let ingredient3 = try? container.decodeIfPresent(String.self, forKey: .ingredient3)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure3 = try? container.decodeIfPresent(String.self, forKey: .measure3)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient3.isEmpty {
            ingredients?.append(Ingredient(name: ingredient3, quantity: measure3))
        }
        
        if let ingredient4 = try? container.decodeIfPresent(String.self, forKey: .ingredient4)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure4 = try? container.decodeIfPresent(String.self, forKey: .measure4)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient4.isEmpty {
            ingredients?.append(Ingredient(name: ingredient4, quantity: measure4))
        }
        
        if let ingredient5 = try? container.decodeIfPresent(String.self, forKey: .ingredient5)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure5 = try? container.decodeIfPresent(String.self, forKey: .measure5)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient5.isEmpty {
            ingredients?.append(Ingredient(name: ingredient5, quantity: measure5))
        }
        
        if let ingredient6 = try? container.decodeIfPresent(String.self, forKey: .ingredient6)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure6 = try? container.decodeIfPresent(String.self, forKey: .measure6)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient6.isEmpty {
            ingredients?.append(Ingredient(name: ingredient6, quantity: measure6))
        }
        
        if let ingredient7 = try? container.decodeIfPresent(String.self, forKey: .ingredient7)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure7 = try? container.decodeIfPresent(String.self, forKey: .measure7)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient7.isEmpty {
            ingredients?.append(Ingredient(name: ingredient7, quantity: measure7))
        }
        
        if let ingredient8 = try? container.decodeIfPresent(String.self, forKey: .ingredient8)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure8 = try? container.decodeIfPresent(String.self, forKey: .measure8)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient8.isEmpty {
            ingredients?.append(Ingredient(name: ingredient8, quantity: measure8))
        }
        
        if let ingredient9 = try? container.decodeIfPresent(String.self, forKey: .ingredient9)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure9 = try? container.decodeIfPresent(String.self, forKey: .measure9)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient9.isEmpty {
            ingredients?.append(Ingredient(name: ingredient9, quantity: measure9))
        }
        
        if let ingredient10 = try? container.decodeIfPresent(String.self, forKey: .ingredient10)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure10 = try? container.decodeIfPresent(String.self, forKey: .measure10)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient10.isEmpty {
            ingredients?.append(Ingredient(name: ingredient10, quantity: measure10))
        }
        
        if let ingredient11 = try? container.decodeIfPresent(String.self, forKey: .ingredient11)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure11 = try? container.decodeIfPresent(String.self, forKey: .measure11)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient11.isEmpty {
            ingredients?.append(Ingredient(name: ingredient11, quantity: measure11))
        }
        
        if let ingredient12 = try? container.decodeIfPresent(String.self, forKey: .ingredient12)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure12 = try? container.decodeIfPresent(String.self, forKey: .measure12)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient12.isEmpty {
            ingredients?.append(Ingredient(name: ingredient12, quantity: measure12))
        }
        
        if let ingredient13 = try? container.decodeIfPresent(String.self, forKey: .ingredient13)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure13 = try? container.decodeIfPresent(String.self, forKey: .measure13)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient13.isEmpty {
            ingredients?.append(Ingredient(name: ingredient13, quantity: measure13))
        }
        
        if let ingredient14 = try? container.decodeIfPresent(String.self, forKey: .ingredient14)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure14 = try? container.decodeIfPresent(String.self, forKey: .measure14)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient14.isEmpty {
            ingredients?.append(Ingredient(name: ingredient14, quantity: measure14))
        }
        
        if let ingredient15 = try? container.decodeIfPresent(String.self, forKey: .ingredient15)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure15 = try? container.decodeIfPresent(String.self, forKey: .measure15)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient15.isEmpty {
            ingredients?.append(Ingredient(name: ingredient15, quantity: measure15))
        }
        
        if let ingredient16 = try? container.decodeIfPresent(String.self, forKey: .ingredient16)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure16 = try? container.decodeIfPresent(String.self, forKey: .measure16)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient16.isEmpty {
            ingredients?.append(Ingredient(name: ingredient16, quantity: measure16))
        }
        
        if let ingredient17 = try? container.decodeIfPresent(String.self, forKey: .ingredient17)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure17 = try? container.decodeIfPresent(String.self, forKey: .measure17)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient17.isEmpty {
            ingredients?.append(Ingredient(name: ingredient17, quantity: measure17))
        }
        
        if let ingredient18 = try? container.decodeIfPresent(String.self, forKey: .ingredient18)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure18 = try? container.decodeIfPresent(String.self, forKey: .measure18)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient18.isEmpty {
            ingredients?.append(Ingredient(name: ingredient18, quantity: measure18))
        }
        
        if let ingredient19 = try? container.decodeIfPresent(String.self, forKey: .ingredient19)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure19 = try? container.decodeIfPresent(String.self, forKey: .measure19)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient19.isEmpty {
            ingredients?.append(Ingredient(name: ingredient19, quantity: measure19))
        }
        
        if let ingredient20 = try? container.decodeIfPresent(String.self, forKey: .ingredient20)?.trimmingCharacters(in: .whitespacesAndNewlines),
        let measure20 = try? container.decodeIfPresent(String.self, forKey: .measure20)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient20.isEmpty {
            ingredients?.append(Ingredient(name: ingredient20, quantity: measure20))
        }
    }
    
    init(id: Int, name: String, thumbnailUrl: URL?) {
        self.id = id
        self.name = name
        self.thumbnailUrl = thumbnailUrl
    }
}

class DessertResponse: Decodable {
    var meals: [Dessert]
}
