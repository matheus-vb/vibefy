//
//  AlbunsCollectionViewCell.swift
//  Vibefy
//
//  Created by Guilherme Souza on 16/09/22.
//

import UIKit

class AlbunsCollectionViewCell: UICollectionViewCell {
    
    static let id = "AlbunsCell"
    let albumTitleContainer = UIView()
    let artistLabelContainer = UIView()
    let labelStackView = UIStackView()

    
    lazy var albunsImage: UIImageView = {
        let img = UIImage(named: "amanita2")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 186, height: 186)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleToFill
        return imgV
    }()
    
    lazy var albumTitle: UILabel = {
        let label = UILabel()
        let lightAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)]
        let pieces = ["In Rainbows"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: lightAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistiLabel: UILabel = {
        let label = UILabel()
        let lightAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light)]
        let pieces = ["Radiohead"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: lightAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewHierarchy()
        setupViewAttributes()
    }
    
    func setupViewHierarchy(){
        addSubview(albunsImage)
        addSubview(labelStackView)
        
        labelStackView.addArrangedSubview(albumTitleContainer)
        labelStackView.addArrangedSubview(artistLabelContainer)
        
        albumTitleContainer.addSubview(albumTitle)
        artistLabelContainer.addSubview(artistiLabel)
    }
    
    func setupViewAttributes(){
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        labelStackView.axis = .horizontal
        labelStackView.alignment = .fill
        labelStackView.distribution = .fill
        labelStackView.spacing = 4
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
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: self.albunsImage.bottomAnchor, constant: 4),
            labelStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            labelStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelStackView.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            albumTitle.topAnchor.constraint(equalTo: self.albumTitleContainer.topAnchor),
            albumTitle.leadingAnchor.constraint(equalTo: self.albumTitleContainer.leadingAnchor),
            albumTitle.trailingAnchor.constraint(equalTo: self.albumTitleContainer.trailingAnchor, constant: -13),
            //artistiLabel.bottomAnchor.constraint(equalTo: self.artistLabelContainer.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            artistiLabel.topAnchor.constraint(equalTo: self.artistLabelContainer.topAnchor),
            artistiLabel.leadingAnchor.constraint(equalTo: self.artistLabelContainer.leadingAnchor),
            artistiLabel.trailingAnchor.constraint(equalTo: self.artistLabelContainer.trailingAnchor, constant: -13),
            //artistiLabel.bottomAnchor.constraint(equalTo: self.artistLabelContainer.bottomAnchor)
        ])
    }
}
