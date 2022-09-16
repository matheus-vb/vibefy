//
//  model.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

// MARK: - MODEL

import Foundation

// Objeto restaurante
struct RestByMood: Codable {
    
    let mood: String
    let name: String
    let type: String
    let price: String
    let rating: String
    let address: String
    let maskImage: String
    let backImage: String
    let filters: [String]
    let drinks: Bool
    
}


