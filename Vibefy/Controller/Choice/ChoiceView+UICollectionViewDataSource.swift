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
            return artistsAttributes.count
        }else if(collectionView == albunsCollectionView){
            return albumsAttributes.count
        }else if(collectionView == playlistsCollectionView){
            return playlistAttributes.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == artistCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistsCollectionViewCell.id, for: indexPath) as! ArtistsCollectionViewCell
            Task{
                let imageData = await AppleMusicAPI.donwloadImageData(withPath: artistsAttributes[indexPath.item].artwork.url, width: 200, height: 200)
                let image = UIImage(data: imageData)
                cell.artistImage.image = image
            }
            return cell
        } else if collectionView == albunsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbunsCollectionViewCell.id, for: indexPath) as! AlbunsCollectionViewCell
            Task{
                let imageData = await AppleMusicAPI.donwloadImageData(withPath: albumsAttributes[indexPath.item].artwork.url, width: 200, height: 200)
                let image = UIImage(data: imageData)
                cell.albunsImage.image = image
                cell.albumTitle.text = albumsAttributes[indexPath.item].name
                cell.albumTitle.text = albumsAttributes[indexPath.item].artistName
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaylistsCollectionViewCell.id, for: indexPath) as! PlaylistsCollectionViewCell
            Task{
                cell.playlistTitle.text = playlistAttributes[indexPath.item].name
            }
            return cell
        }
    }
}
