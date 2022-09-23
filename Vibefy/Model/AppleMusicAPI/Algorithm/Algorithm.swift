//
//  File.swift
//  Vibefy
//
//  Created by matheusvb on 22/09/22.
//

import Foundation
import UIKit
import SwiftUI

class Algorithm {
    //let genres: [String] = ["Pop", "Rock", "Alternativo", "Reggae", "Bossa nova", "MPB", "Pop", "Rock", "Rock"]
    var countIntrospective: Int = 0
    var countVibrant: Int = 0
    var countChill: Int = 0
    var countRomantic: Int = 0
    var countIntense: Int = 0
    var countBeach: Int = 0
    var countCheerful: Int = 0
    var countNostalgic: Int = 0
    var countDance: Int = 0
    var countNatural: Int = 0
    var countSpiritual: Int = 0
    var countChaotic: Int = 0
    var countElegant: Int = 0
    
    func calculateMood(genres: [String]) -> String {
        print(genres)
        for genre in genres {
            getIndex(genreRaw: genre)
        }
        
//        print("Beach: \(countNatural)")
//        print("Dance: \(countDance)")
//        print("Natural: \(countNatural)")
//        print("Chill: \(countChill)")
//        print("Romantic: \(countRomantic)")
//        print("Spiritual: \(countSpiritual)")
//        print("Introspective: \(countIntrospective)")
//        print("Vibrant: \(countVibrant)")
//        print("Cheerful: \(countCheerful)")
//        print("Chaotic: \(countChaotic)")
//        print("Intense: \(countIntense)")
//        print("Nostalgic: \(countNostalgic)")
//        print("Elegant: \(countElegant)")

        let winner = getWinner()
        return winner
    }
    
    func getIndex(genreRaw: String) {
        
        let genre = genreRaw.lowercased()
        
        if (genre == "alternativo" || genre == "indie pop" || genre == "alternative") {
            countNostalgic += 3
            countChill += 4
            countIntrospective += 3
        } else if (genre == "rock" || genre == "pop/rock"  || genre == "hip-hop/rap") {
            countIntense += 4
            countNostalgic += 4
            countIntrospective += 2
            countChaotic += 2
        } else if (genre == "blues-rock" || genre == "college rock") {
            countNostalgic += 4
            countIntrospective += 3
            countChill += 2
        } else if (genre == "eletrônica" || genre == "dance") {
            countDance += 5
            countIntense += 4
            countVibrant += 3
        } else if (genre == "música latina urbana" || genre == "baile funk") {
            countBeach += 3
            countDance += 5
            countVibrant += 3
            countCheerful += 3
        } else if (genre == "hard rock" || genre == "metal") {
            countChaotic += 3
            countNostalgic += 3
            countIntense += 5
        } else if (genre == "punk") {
            countChaotic += 5
        } else if (genre == "erudita" || genre == "jazz") {
            countElegant += 5
            countNostalgic += 4
            countRomantic += 3
            countChill += 3
        } else if (genre == "bossa nova") {
            countRomantic += 4
            countNostalgic += 4
            countIntrospective += 4
        } else if (genre == "blues") {
            countIntrospective += 4
            countNostalgic += 3
            countRomantic += 2
        } else if (genre == "pop" || genre == "k-pop" || genre == "j-pop") {
            countIntense += 1
            countCheerful += 4
            countVibrant += 4
        } else if (genre == "pagode" || genre == "samba") {
            countRomantic += 2
            countCheerful += 4
            countDance += 3
        } else if (genre == "forró") {
            countRomantic += 4
            countNatural += 2
            countDance += 4
        } else if (genre == "mpb") {
            countChill += 2
            countElegant += 3
            countIntrospective += 4
        } else if (genre == "brasileira") {
            countDance += 4
            countBeach += 4
            countNatural += 3
        } else if (genre == "música religiosa" || genre == "trilha sonora") {
            countSpiritual += 5
        } else if (genre == "r&b/soul") {
            countSpiritual += 2
            countRomantic += 3
            countChill += 4
        } else if (genre == "reggae") {
            countNatural += 2
            countChill += 2
            countBeach += 4
            countSpiritual += 2
        }
        
                
       
    }
    
    func getWinner() -> String{
        let list = [(countChill, "tranquila"), (countDance, "dancante"), (countBeach,"praieira"), (countElegant, "elegante"), (countIntense,"intensa"), (countChaotic,"caotica"), (countCheerful,"alegre"), (countVibrant,"vibrante"), (countNatural,"natural"), (countRomantic,"romantica"), (countSpiritual,"espirituosa"), (countNostalgic,"nostalgica"), (countIntrospective,"introspectiva")]
        var winner_count: Int = 0
        var winner_name: String = ""
        for i in 0...12 {
            if list[i].0 > winner_count {
                winner_count = list[i].0
                winner_name = list[i].1
            }
        }
        return winner_name
    }
}
/*
 Alternativo
 Rock
 Blues
 Pop
 Jazz
 Metal
 K-pop
 Pagode
 Brasileira
 MPB
 Sertanejpo
 Erudita
 R&B/soul
 Hip-Hop/Rap
 Hard rock
 Música religiosa
 Dance
 Trilha sonora
 J-pop
 Eletrônica
 Pop/Rock
 Baile Funk
 Música latina urbana
 Forró
 Samba
 Punk
 Indie pop
 Reggae
 Blues-Rock
 Psicodélico
 
 */
