//
//  SongAPI.swift
//  Vibefy
//
//  Created by jpcm2 on 16/09/22.
//

import StoreKit
import UIKit
import SwiftUI

var songResult = SongResponse(data: [])

class AppleMusicAPI {
    let developerToken = ""
    
    func getUserToken() -> String {
        var userToken = String()
        let lock = DispatchSemaphore(value: 0)
        
        SKCloudServiceController().requestUserToken(forDeveloperToken: developerToken) { (receivedToken, error) in
            guard error == nil else { return }
            if let token = receivedToken {
                print("oooi")
                userToken = token
                lock.signal()
            }
        }
        print(userToken)
        lock.wait()
        return userToken
    }
    
    func getUserToken(completion: @escaping(_ userToken: String?) -> Void) {
        SKCloudServiceController().requestUserToken(forDeveloperToken: developerToken) { (receivedToken, error) in
            guard error == nil else { return }
            
            completion(receivedToken)
        }
    }
    
    
    //MARK: - STANDARD
    
    func fetchStorefrontID(userToken: String, type: String) async -> [Song] {
        var storefrontID: String! = ""
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/recent/played/tracks")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                songResult = try decoder.decode(SongResponse.self, from: data!)
                print(songResult.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(songResult.data.count)")
        return songResult.data

    }
    
    //MARK: - SONGS
    
    func fetchSongs(userToken: String, type: String) async -> [Song] {
        var storefrontID: String! = ""
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/recent/played/tracks")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                songResult = try decoder.decode(SongResponse.self, from: data!)
                print(songResult.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(songResult.data.count)")
        return songResult.data

    }
    
    //MARK: - ARTISTS
    
    func fetchArtists(userToken: String, type: String) async -> [Song] {
        var storefrontID: String! = ""
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/recent/played/tracks")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                songResult = try decoder.decode(SongResponse.self, from: data!)
                print(songResult.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(songResult.data.count)")
        return songResult.data

    }
    
    //MARK: - PLAYLISTS
    
    func fetchPlaylists(userToken: String, type: String) async -> [Song] {
        var storefrontID: String! = ""
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/recent/played/tracks")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                songResult = try decoder.decode(SongResponse.self, from: data!)
                print(songResult.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(songResult.data.count)")
        return songResult.data

    }
    
    //MARK: - ALBUNS
    
    func fetchAlbuns(userToken: String, type: String) async -> [Song] {
        var storefrontID: String! = ""
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/recent/played/tracks")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                songResult = try decoder.decode(SongResponse.self, from: data!)
                print(songResult.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(songResult.data.count)")
        return songResult.data

    }
    
}
