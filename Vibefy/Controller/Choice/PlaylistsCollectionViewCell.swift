//
//  PlaylistsCollectionViewCell.swift
//  Vibefy
//
//  Created by Guilherme Souza on 16/09/22.
//

import UIKit

class PlaylistsCollectionViewCell: UICollectionViewCell {
    
    static let id = "PlaylistsCell"
    let playlistLabelContainer = UIView()
    
    lazy var playlistTitle: UILabel = {
        let label = UILabel()
        let lightAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .light)]
        let pieces = ["In Rainbows"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: lightAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 2
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bgImage: UIImageView = {
        let bg = UIImageView()
        bg.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        bg.translatesAutoresizingMaskIntoConstraints = false
        return bg
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewHierarchy()
        setupViewAttributes()
    }
    
    func setupViewHierarchy(){
        addSubview(bgImage)
        addSubview(playlistLabelContainer)
        playlistLabelContainer.addSubview(playlistTitle)
    }
    
    func setupViewAttributes(){
        playlistLabelContainer.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            playlistLabelContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            playlistLabelContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            playlistLabelContainer.widthAnchor.constraint(equalToConstant: self.frame.width),
            playlistLabelContainer.heightAnchor.constraint(equalToConstant: self.frame.height)
        ])
        
        NSLayoutConstraint.activate([
            playlistTitle.topAnchor.constraint(equalTo: playlistLabelContainer.topAnchor),
            playlistTitle.leadingAnchor.constraint(equalTo: playlistLabelContainer.leadingAnchor),
            playlistTitle.trailingAnchor.constraint(equalTo: playlistLabelContainer.trailingAnchor),
            playlistTitle.bottomAnchor.constraint(equalTo: playlistLabelContainer.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bgImage.topAnchor.constraint(equalTo: self.topAnchor),
            bgImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])

    }
}
