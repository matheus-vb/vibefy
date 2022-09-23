//
//  PlaylistInfoAttributes.swift
//  Vibefy
//
//  Created by jpcm2 on 22/09/22.
//

import UIKit

struct PlaylistInfoAttributes: Codable {
    let genreNames: [String]
    let name: String
    
    init(genreNames: [String], name: String){
        self.genreNames = genreNames
        self.name = name
    }
}
