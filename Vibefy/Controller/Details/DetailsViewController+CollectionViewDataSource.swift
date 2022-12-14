//
//  DetailsViewController+CollectionViewDataSource.swift
//  Vibefy
//
//  Created by jpcm2 on 20/09/22.
//

import UIKit

extension DetailsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == filtrosCollection){
            return restauranteSelecionado.filters.count
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == filtrosCollection){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltrosCollectionViewCell.id, for: indexPath) as! FiltrosCollectionViewCell
            cell.filtroLabel.text = restauranteSelecionado.filters[indexPath.item]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.id, for: indexPath) as! ImagesCollectionViewCell
            cell.albunsImage.image = restauranteSelecionado.backImage
            return cell
        }
    }
}
