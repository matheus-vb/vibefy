//
//  ImagesCollectionViewCell.swift
//  Vibefy
//
//  Created by jpcm2 on 20/09/22.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
 
    static let id = "ImagesCell"
    
    private lazy var albunsImage: UIImageView = {
        let img = UIImage(named: "amanita2")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 180, height: 112)
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
            albunsImage.topAnchor.constraint(equalTo: self.topAnchor),
            albunsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            albunsImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            albunsImage.heightAnchor.constraint(equalToConstant: 186),
        ])
    }
}
