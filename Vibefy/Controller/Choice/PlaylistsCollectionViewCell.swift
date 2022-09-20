//
//  PlaylistsCollectionViewCell.swift
//  Vibefy
//
//  Created by Guilherme Souza on 16/09/22.
//

import UIKit

class PlaylistsCollectionViewCell: UICollectionViewCell {
    
    static let id = "PlaylistsCell"
    
    private lazy var albunsImage: UIImageView = {
        let img = UIImage(named: "amanita2")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 186, height: 186)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleToFill
        return imgV
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewHierarchy()
        setupViewAttributes()
    }
    
    func setupViewHierarchy(){
        addSubview(albunsImage)
    }
    
    func setupViewAttributes(){
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            albunsImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            albunsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            albunsImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11.5),
            albunsImage.heightAnchor.constraint(equalToConstant: 186),
        ])
    }
}
