//
//  AlbumAttributes.swift
//  Vibefy
//
//  Created by jpcm2 on 22/09/22.
//

import Foundation

struct AlbumAttributes: Codable{
    let genreNames: [String]
    let name: String
    let artistName: String
    let artwork: AlbumArtWork
    
    init(genres: [String], name: String, artworkURL: String, artistName: String){
        self.genreNames = genres
        self.name = name
        self.artistName = artistName
        self.artwork = AlbumArtWork(url: artworkURL)
    }
}
