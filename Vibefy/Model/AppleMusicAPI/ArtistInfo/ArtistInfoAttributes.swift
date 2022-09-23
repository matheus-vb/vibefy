//
//  ArtistInfoAttributes.swift
//  Vibefy
//
//  Created by jpcm2 on 21/09/22.
//

import Foundation

struct ArtistInfoAttributes: Codable{
    //let genreNames: [String]
    
    var name: String
    var artwork: ArtistInfoAttributesArtWork
    var genreNames: [String]
    
    init(name: String, url: String, genreNames: [String]) {
        self.name = name
        self.artwork = ArtistInfoAttributesArtWork(url: url)
        self.genreNames = genreNames
    }
}
