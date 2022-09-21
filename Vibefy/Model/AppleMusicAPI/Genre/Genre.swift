//
//  Genre.swift
//  Vibefy
//
//  Created by matheusvb on 21/09/22.
//

import Foundation

struct Genre: Codable {
    let id: String
    let type: String
    let href: String
    let attributes: GenreAttributes
}
