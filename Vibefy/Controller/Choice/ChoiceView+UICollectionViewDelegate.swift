//
//  ChoiceView+UICollectionViewDelegate.swift
//  Vibefy
//
//  Created by Guilherme Souza on 16/09/22.
//

import UIKit
import Foundation

extension ChoiceViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let calculadora = Algorithm()
        if(collectionView == self.artistCollectionView){
            print("OOOOIII AQUIIIIIIIII")
            print("--------------------------------")
            let moodCalculado = calculadora.calculateMood(genres: artistsAttributes[indexPath.item].genreNames)
            let restByMood = RestByMoodFunc()
            let allRestaurantes = restByMood.restaurants()
            var sugestoes: [RestByMood] = []
            for val in allRestaurantes{
                if(val.mood == moodCalculado){
                    print("CHEGEUHGEUHGEUHGHUEG")
                    sugestoes = val.suggestions
                }
            }
            
            result = sugestoes
            bgImage = "BG \(moodCalculado)"
            vibeName = moodCalculado
            print("--------------------------------")
        }else if(collectionView == self.albunsCollectionView){
            print("OOOOIII AQUIIIIIIIII")
            print("--------------------------------")
            let moodCalculado = calculadora.calculateMood(genres: albumsAttributes[indexPath.item].genreNames)
            let restByMood = RestByMoodFunc()
            let allRestaurantes = restByMood.restaurants()
            var sugestoes: [RestByMood] = []
            for val in allRestaurantes{
                if(val.mood == moodCalculado){
                    print("CHEGEUHGEUHGEUHGHUEG")
                    sugestoes = val.suggestions
                }
            }
            
            result = sugestoes
            bgImage = "BG \(moodCalculado)"
            vibeName = moodCalculado
            print("--------------------------------")
        }
        let api = AppleMusicAPI()
        api.getUserToken { userToken in
            guard let userToken = userToken else {
                return
            }
            if(collectionView == self.playlistsCollectionView){
                print("OOOOIII AQUIIIIIIIII")
                print("--------------------------------")
                print(playlistAttributes[indexPath.item].id)
                Task{
                    print("Entrou aqui")
                    let retorno = await api.fetchPlaylistsInfo(userToken: userToken, id: playlistAttributes[indexPath.item].id)
                    var generosString: [String] = []
                    for val in retorno {
                        for key in val.attributes.genreNames {
                            generosString.append(key)
                        }
                    }
                    print(calculadora.calculateMood(genres: generosString))
                    let moodCalculado = calculadora.calculateMood(genres: generosString)
                    let restByMood = RestByMoodFunc()
                    let allRestaurantes = restByMood.restaurants()
                    var sugestoes: [RestByMood] = []
                    for val in allRestaurantes{
                        if(val.mood == moodCalculado){
                            print("CHEGEUHGEUHGEUHGHUEG")
                            sugestoes = val.suggestions
                        }
                    }
                    result = sugestoes
                    bgImage = "BG \(moodCalculado)"
                    vibeName = moodCalculado
                }
                print("--------------------------------")
            }
            let rootViewController = LoadingPageViewController()
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.pushViewController(rootViewController, animated: true)
        }
    }
}
