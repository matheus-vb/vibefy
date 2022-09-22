//
//  AlbumArtWork.swift
//  Vibefy
//
//  Created by jpcm2 on 22/09/22.
//

import Foundation

struct AlbumArtWork: Codable {
    let url: String
    
    init(url: String){
        self.url = url
    }
}
