//
//  RecentsCollectionViewCell.swift
//  Vibefy
//
//  Created by matheusvb on 13/09/22.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    static let id = "FavoritesCell"
    
    private lazy var imageOne: UIImageView = {
        let img = UIImage(named: "bacurau")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 100, height: 100)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //contentView.backgroundColor = .purple
        
        addSubview(imageOne)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageOne.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        
    }
    

    
    
    
    
    
    
}
