//
//  RecentsCollectionViewCell.swift
//  Vibefy
//
//  Created by matheusvb on 13/09/22.
//

import UIKit

class RecentsCollectionViewCell: UICollectionViewCell {
    
    static let id = "RecentsCell"
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //contentView.backgroundColor = .green
        
        imageOne.contentMode = .scaleAspectFit
        
        addSubview(imageOne)
        addSubview(titleLabel)
        addSubview(subLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
     
        imageOne.frame = CGRect(x: 0, y: 0, width: 170, height: 96)
        titleLabel.frame = CGRect(x: 8, y: 96, width: 170, height: 30)
        subLabel.frame = CGRect(x: 8, y: 120, width: 170, height: 20)
        
    }
    
    
}
