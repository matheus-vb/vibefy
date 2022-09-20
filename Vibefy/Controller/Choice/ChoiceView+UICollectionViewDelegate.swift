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
        print(indexPath)
    }
}
