//
//  ArtistsCollectionViewCell.swift
//  Vibefy
//
//  Created by Guilherme Souza on 16/09/22.
//

import UIKit

class ArtistsCollectionViewCell: UICollectionViewCell {
    
    static let id = "ArtistsCell"
    
    lazy var artistImage: UIImageView = {
        let img = UIImage(named: "secondbubbleImage")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 100, height: 100)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleToFill
        imgV.layer.borderWidth = 0
        imgV.layer.masksToBounds = false
        imgV.layer.cornerRadius = imgV.frame.size.width/2
        imgV.clipsToBounds = true
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        artistImage.contentMode = .scaleToFill
        addSubview(artistImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            artistImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            artistImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            artistImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            artistImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
