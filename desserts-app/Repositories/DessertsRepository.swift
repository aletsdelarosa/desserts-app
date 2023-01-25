//
//  DessertsRepository.swift
//  desserts-app
//
//  Created by Alets on 1/24/23.
//

import Foundation
import UIKit

protocol DessertsRepositoryDelegate {
    func didGetDesserts(_ desserts: [Dessert])
    func didGetDessertDetails(_ dessert: Dessert)
}

class DessertsRepository {
    
    var delegate: DessertsRepositoryDelegate?
    
    func getDesserts() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            delegate?.didGetDesserts([])
            return
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let decoder = JSONDecoder()
            
            if let data = data {
                guard let dessertsResponse = try? decoder.decode(DessertResponse.self, from: data) else {
                    fatalError("Failed to decode.")
                }
                
                DispatchQueue.main.async {
                    self.delegate?.didGetDesserts(dessertsResponse.meals.sorted { $0.name < $1.name })
                }
            }
            else {
                DispatchQueue.main.async {
                    self.delegate?.didGetDesserts([])
                }
            }
        }.resume()
    }
    
    func getDetails(dessert: Dessert) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessert.id)")
        else {
            self.delegate?.didGetDessertDetails(dessert)
            return
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let decoder = JSONDecoder()
            
            if let data = data {
                guard let dessertsResponse = try? decoder.decode(DessertResponse.self, from: data) else {
                    fatalError("Failed to decode.")
                }
                
                guard let dessertFromResponse = dessertsResponse.meals.first else {
                    DispatchQueue.main.async {
                        self.delegate?.didGetDessertDetails(dessert)
                    }
                    
                    return
                }
                
                dessertFromResponse.containsAllData = true
                
                DispatchQueue.main.async {
                    self.delegate?.didGetDessertDetails(dessertFromResponse)
                }
            }
            else {
                DispatchQueue.main.async {
                    self.delegate?.didGetDessertDetails(dessert)
                }
            }
        }.resume()
    }
}
