//
//  SongAPI.swift
//  Vibefy
//
//  Created by jpcm2 on 16/09/22.
//

import StoreKit
import UIKit
import SwiftUI

var artistData = ArtistResponse(data: [])
var artistInfoResult = ArtistInfoResponse(data: [])
var albumResult = AlbumResponse(data: [])
var playlistResult = PlaylistResponse(data: [])
var playlistInfoResult = PlaylistResponse(data: [])
var playlistGenreResult = PlaylistInfoResponse(data: [])
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
    
    //MARK: -DOWNLOAD MEDIA
    
    static func donwloadImageData(withPath: String, width: Int, height: Int) async -> Data {
        let urlString = withPath
                
        let url: URL = URL(string: urlString.replacingOccurrences(of: "{w}x{h}", with: "\(width)x\(height)"))!
        
        let session = URLSession.shared
        
        do {
            let (data, response) = try await session.data(from: url)
            
            return data
        } catch {
            print(error)
        }
        
        return Data()
    }
    
    //    //MARK: - SONGS
        func fetchSongs(userToken: String) async -> [Song] {
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
    
    func fetchArtists(userToken: String) async -> [Artist] {
        var storefrontID: String! = ""
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/library/artists")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                artistData = try decoder.decode(ArtistResponse.self, from: data!)
                print(artistData.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(artistData.data.count)")
        return artistData.data

    }
    
    //MARK: - ARTISTS INFO
    
    func fetchArtistInfo(userToken: String, id: String) async -> [ArtistInfo] {
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/library/artists/\(id)/catalog")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                artistInfoResult = try decoder.decode(ArtistInfoResponse.self, from: data!)
                print(artistInfoResult.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(artistInfoResult.data.count)")
        return artistInfoResult.data

    }
    
    //MARK: - ALBUNS
    
    func fetchAlbuns(userToken: String) async -> [Album] {
        var storefrontID: String! = ""
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/library/albums")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                albumResult = try decoder.decode(AlbumResponse.self, from: data!)
                print(albumResult.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(albumResult.data.count)")
        return albumResult.data

    }
    
    //MARK: - PLAYLISTS
    
    func fetchPlaylists(userToken: String) async -> [Playlist] {
        var storefrontID: String! = ""
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/library/playlists")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                playlistResult = try decoder.decode(PlaylistResponse.self, from: data!)
                print(playlistResult.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(playlistResult.data.count)")
        return playlistResult.data

    }
    
    func fetchPlaylistsInfo(userToken: String, id: String) async -> [PlaylistInfo] {
        var storefrontID: String! = ""
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/library/playlists/\(id)/tracks")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
                
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
            guard error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                playlistGenreResult = try decoder.decode(PlaylistInfoResponse.self, from: data!)
                print(playlistGenreResult.data.count)
                semaphore.signal()
                
            } catch {
                print (error)
            }

        }.resume()
        
        semaphore.wait()
        print("Count: \(playlistGenreResult.data.count)")
        return playlistGenreResult.data

    }
    
    
    
    //MARK: - STANDARD
    
//    func fetchStorefrontID(userToken: String) async -> [Song] {
//        var storefrontID: String! = ""
//        //p.rXAJKDruMmOAxBK
//        let musicURL = URL(string: "https://api.music.apple.com/v1/me/library/artists")!
//        var musicRequest = URLRequest(url: musicURL)
//        musicRequest.httpMethod = "GET"
//        musicRequest.addValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
//        musicRequest.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
//
//        let semaphore = DispatchSemaphore(value: 0)
//
//        URLSession.shared.dataTask(with: musicRequest) { (data, response, error)  in
//            guard error == nil else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                songResult = try decoder.decode(SongResponse.self, from: data!)
//                print(songResult.data.count)
//                semaphore.signal()
//
//            } catch {
//                print (error)
//            }
//
//        }.resume()
//
//        semaphore.wait()
//        print("Count: \(songResult.data.count)")
//        return songResult.data
//
//    }
//
//    
//
    
}
