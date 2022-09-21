//
//  SongAttributes.swift
//  Vibefy
//
//  Created by matheusvb on 21/09/22.
//

import Foundation


struct SongAttributes: Codable {
    let name: String
    let artistName: String
    let genreNames: [String]?
}
