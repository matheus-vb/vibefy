//
//  DragView+UICollectionViewDelegate.swift
//  Vibefy
//
//  Created by matheusvb on 13/09/22.
//

import Foundation
import UIKit

extension DragView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print (indexPath)
    }
}
