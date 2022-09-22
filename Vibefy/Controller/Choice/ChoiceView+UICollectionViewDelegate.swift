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
        
        let rootViewController = ConfirmViewController()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.pushViewController(rootViewController, animated: true)
    }
}
