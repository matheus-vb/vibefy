//
//  PlaylistAttributes.swift
//  Vibefy
//
//  Created by jpcm2 on 22/09/22.
//

import Foundation


struct PlaylistAttributes: Codable{
    let name: String
    
    init(name: String){
        self.name = name
    }
}
