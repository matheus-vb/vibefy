//
//  ChoiceView+UICollectionViewDataSource.swift
//  Vibefy
//
//  Created by Guilherme Souza on 16/09/22.
//

import UIKit
import Foundation

extension ChoiceViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == artistCollectionView){
            return 9
        }else if(collectionView == albunsCollectionView){
            return 8
        }else if(collectionView == playlistsCollectionView){
            return 7
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == artistCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistsCollectionViewCell.id, for: indexPath) as! ArtistsCollectionViewCell
            return cell
        } else if collectionView == albunsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbunsCollectionViewCell.id, for: indexPath) as! AlbunsCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistsCollectionViewCell.id, for: indexPath) as! PlaylistsCollectionViewCell
            return cell
        }
    }
}
