//
//  SongAttributes.swift
//  Vibefy
//
//  Created by matheusvb on 21/09/22.
//

import Foundation


struct SongAttributes: Codable {
    let name: String
    let genreNames: [String]
    
    init(name: String, genreNames: [String]){
        self.name = name
        self.genreNames = genreNames
    }
}
