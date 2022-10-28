//
//  DragView+UICollectionViewDataSource.swift
//  Vibefy
//
//  Created by matheusvb on 13/09/22.
//

import Foundation
import UIKit

extension DragView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recentsCollectionView {
            if recentlySeen.count > 10 {
                recentlySeen.popLast()
            }
            return recentlySeen.count
            
        } else {
            return favRestaurants.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recentsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentsCollectionViewCell.id, for: indexPath) as! RecentsCollectionViewCell
            cell.imageOne.image =  recentlySeen[indexPath.item].backImage
            cell.titleLabel.text = recentlySeen[indexPath.item].name
            cell.subLabel.text = recentlySeen[indexPath.item].type
            //cell.backgroundColor = .cyan
            return cell
        }
        
        if collectionView == favoritesCollectionView {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCollectionViewCell.id, for: indexPath) as! FavoritesCollectionViewCell
                    
                    let restByMood = RestByMoodFunc()
                    let allRestaurantes = restByMood.restaurants()
                    var sugestoes: [RestByMood] = []
                    for val in allRestaurantes{
                        if(val.mood == favRestaurants[indexPath.item].mood){
                            print("CHEGEUHGEUHGEUHGHUEG")
                            sugestoes = val.suggestions
                        }
                    }
                    for i in sugestoes {
                        if i.name == favRestaurants[indexPath.item].name {
                            cell.setupCell(image: i.maskImage ?? UIImage())
                        }
                    }
                    return cell
                    
                } else {
            return UICollectionViewCell()
        }
        
    }
    
    
}
