//
//  RecentsCollectionViewCell.swift
//  Vibefy
//
//  Created by matheusvb on 13/09/22.
//

import UIKit

class RecentsCollectionViewCell: UICollectionViewCell {
    
    static let id = "RecentsCell"
    
    private lazy var homeButton: UIButton = {
        let button = UIButton()
        let bgImage = UIImage(named: "favorite")
        let bgImageView = UIImageView(image: bgImage)
        button.setBackgroundImage(UIImage(named: "favorite"), for: .normal)
        button.layer.frame = CGRect(x: 0.0, y: 0.0, width: bgImageView.frame.width, height: bgImageView.frame.height)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(tapFavorite), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var imageOne: UIImageView = {
        let img = UIImage(named: "liamba")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 100, height: 100)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit
        return imgV
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Liamba"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Drinks e bar"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var favImg: UIImageView = {
        let img = UIImage(named: "favorite")
        let imgV = UIImageView(image: img)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit

        
        return imgV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //contentView.backgroundColor = .purple
        
        imageOne.contentMode = .scaleAspectFit
        
        addSubview(imageOne)
        addSubview(titleLabel)
        addSubview(subLabel)
        addSubview(homeButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
     
        imageOne.frame = CGRect(x: 11.5, y: 0, width: 177, height: 108)
        homeButton.frame = CGRect(x: 158, y: 116, width: homeButton.frame.width, height: homeButton.frame.height)
        titleLabel.frame = CGRect(x: 11.5, y: 110, width: 170, height: 30)
        subLabel.frame = CGRect(x: 11.5, y: 134, width: 170, height: 20)
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else {
//            return
//        }
//
//        let loc = touch.location(in: favImg)
//
//        if favImg.bounds.contains(loc) {
//            favImg.image = UIImage(named: "favoriteFill")
//        }
//    }
    
    @objc func tapFavorite() {
        print("OOOOi")
        homeButton.setImage(UIImage(named: "favoriteFill"), for: .normal)
    }
    
    
    
    
}
