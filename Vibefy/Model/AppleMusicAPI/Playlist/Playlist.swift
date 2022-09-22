//
//  Playlist.swift
//  Vibefy
//
//  Created by jpcm2 on 22/09/22.
//

import Foundation

struct Playlist: Codable {
    let id: String
    let attributes: PlaylistAttributes
    
    init(id: String, nameP: String){
        self.id = id
        self.attributes = PlaylistAttributes(name: nameP)
    }
}
