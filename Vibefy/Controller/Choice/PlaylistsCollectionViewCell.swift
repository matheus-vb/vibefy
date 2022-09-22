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
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewHierarchy()
        setupViewAttributes()
    }
    
    func setupViewHierarchy(){
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
            playlistTitle.topAnchor.constraint(equalTo: playlistLabelContainer.topAnchor, constant: 80),
            playlistTitle.leadingAnchor.constraint(equalTo: playlistLabelContainer.leadingAnchor, constant: 10),
            playlistTitle.trailingAnchor.constraint(equalTo: playlistLabelContainer.trailingAnchor, constant: -10),
            playlistTitle.bottomAnchor.constraint(equalTo: playlistLabelContainer.bottomAnchor, constant: -80),
        ])

    }
}
