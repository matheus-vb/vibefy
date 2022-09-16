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
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recentsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentsCollectionViewCell.id, for: indexPath) as! RecentsCollectionViewCell
            //cell.backgroundColor = .cyan
            return cell
        }
        
        if collectionView == favoritesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCollectionViewCell.id, for: indexPath) as! FavoritesCollectionViewCell
            //cell.backgroundColor = .cyan
            return cell
        } else {
            return UICollectionViewCell()            
        }
        
    }
    
    
}
