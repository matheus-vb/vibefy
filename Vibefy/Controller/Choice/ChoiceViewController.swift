//
//  ChoiceView.swift
//  Vibefy
//
//  Created by Guilherme Souza on 16/09/22.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    let artistLabelContainer = UIView()
    let albunsLabelContainer = UIView()
    let playlistsLabelContainer = UIView()
    let choiceStackView = UIStackView()
    
    private lazy var choiceBG: UIImageView = {
        let imageName = "BGChoiceScreen.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var artistLabel: UILabel = {
        let label: UILabel = UILabel()
        let lightAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .light)]
        let pieces = ["Artistas"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: lightAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var albunsLabel: UILabel = {
        let label: UILabel = UILabel()
        let lightAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .light)]
        let pieces = ["Álbuns"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: lightAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var playlistsLabel: UILabel = {
        let label: UILabel = UILabel()
        let lightAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .light)]
        let pieces = ["Playlists"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: lightAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    lazy var artistCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.itemSize = CGSize(width: 120, height: 108)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 371, height: 108), collectionViewLayout: viewLayout)
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ArtistsCollectionViewCell.self, forCellWithReuseIdentifier: ArtistsCollectionViewCell.id)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var albunsCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.itemSize = CGSize(width: 200, height: 244)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 371, height: 244), collectionViewLayout: viewLayout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(AlbunsCollectionViewCell.self, forCellWithReuseIdentifier: AlbunsCollectionViewCell.id)
        collectionView.backgroundColor = .clear
        //collectionView.backgroundColor = .green
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var playlistsCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.itemSize = CGSize(width: 186, height: 186)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 371, height: 244), collectionViewLayout: viewLayout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PlaylistsCollectionViewCell.self, forCellWithReuseIdentifier: PlaylistsCollectionViewCell.id)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.backgroundColor = .blue
        return collectionView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistCollectionView.delegate = self
        artistCollectionView.dataSource = self
        albunsCollectionView.delegate = self
        albunsCollectionView.dataSource = self
        playlistsCollectionView.delegate = self
        playlistsCollectionView.dataSource = self
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }

    
    func setupViewHierarchy(){
        self.view.addSubview(choiceBG)
        self.view.addSubview(scrollView)
        
        self.scrollView.addSubview(artistLabelContainer)
        self.scrollView.addSubview(artistCollectionView)
        self.scrollView.addSubview(albunsLabelContainer)
        self.scrollView.addSubview(albunsCollectionView)
        self.scrollView.addSubview(playlistsLabelContainer)
        self.scrollView.addSubview(playlistsCollectionView)
        
        self.artistLabelContainer.addSubview(artistLabel)
        self.albunsLabelContainer.addSubview(albunsLabel)
        self.playlistsLabelContainer.addSubview(playlistsLabel)
    }
    
    func setupViewAttributes(){
        
        artistLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        albunsLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        playlistsLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 812)
        
    }
    
    func setupLayout(){
        
        NSLayoutConstraint.activate([
            choiceBG.topAnchor.constraint(equalTo: self.view.topAnchor),
            choiceBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            choiceBG.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            choiceBG.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.leadingAnchor.constraint(equalTo: self.artistLabelContainer.leadingAnchor, constant: 16),
            artistLabel.trailingAnchor.constraint(equalTo: self.artistLabelContainer.trailingAnchor, constant: -16),
            artistLabel.topAnchor.constraint(equalTo: self.artistLabelContainer.topAnchor, constant: 8),
            artistLabel.bottomAnchor.constraint(equalTo: self.artistLabelContainer.bottomAnchor, constant: -8)
        ])
        NSLayoutConstraint.activate([
            artistLabelContainer.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 4),
            artistLabelContainer.widthAnchor.constraint(equalToConstant: 366),
            artistLabelContainer.heightAnchor.constraint(equalToConstant: 46),
            artistLabelContainer.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        ])
    
        NSLayoutConstraint.activate([
            artistCollectionView.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor),
            artistCollectionView.widthAnchor.constraint(equalToConstant: 371),
            artistCollectionView.heightAnchor.constraint(equalToConstant: 108),
            artistCollectionView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            albunsLabel.leadingAnchor.constraint(equalTo: self.albunsLabelContainer.leadingAnchor, constant: 16),
            albunsLabel.trailingAnchor.constraint(equalTo: self.albunsLabelContainer.trailingAnchor, constant: -16),
            albunsLabel.topAnchor.constraint(equalTo: self.albunsLabelContainer.topAnchor, constant: 8),
            albunsLabel.bottomAnchor.constraint(equalTo: self.albunsLabelContainer.bottomAnchor, constant: -8)
        ])
        NSLayoutConstraint.activate([
            albunsLabelContainer.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 4),
            albunsLabelContainer.widthAnchor.constraint(equalToConstant: 366),
            albunsLabelContainer.heightAnchor.constraint(equalToConstant: 46),
            albunsLabelContainer.topAnchor.constraint(equalTo: self.artistCollectionView.bottomAnchor)
        ])
    
        NSLayoutConstraint.activate([
            albunsCollectionView.topAnchor.constraint(equalTo: self.albunsLabel.bottomAnchor),
            albunsCollectionView.widthAnchor.constraint(equalToConstant: 371),
            albunsCollectionView.heightAnchor.constraint(equalToConstant: 244),
            albunsCollectionView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            playlistsLabel.leadingAnchor.constraint(equalTo: self.playlistsLabelContainer.leadingAnchor, constant: 16),
            playlistsLabel.trailingAnchor.constraint(equalTo: self.playlistsLabelContainer.trailingAnchor, constant: -16),
            playlistsLabel.topAnchor.constraint(equalTo: self.playlistsLabelContainer.topAnchor, constant: 8),
            playlistsLabel.bottomAnchor.constraint(equalTo: self.playlistsLabelContainer.bottomAnchor, constant: -8)
        ])
        NSLayoutConstraint.activate([
            playlistsLabelContainer.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 4),
            playlistsLabelContainer.widthAnchor.constraint(equalToConstant: 366),
            playlistsLabelContainer.heightAnchor.constraint(equalToConstant: 46),
            playlistsLabelContainer.topAnchor.constraint(equalTo: self.albunsCollectionView.bottomAnchor)
        ])
    
        NSLayoutConstraint.activate([
            playlistsCollectionView.topAnchor.constraint(equalTo: self.playlistsLabel.bottomAnchor),
            playlistsCollectionView.widthAnchor.constraint(equalToConstant: 371),
            playlistsCollectionView.heightAnchor.constraint(equalToConstant: 244),
            playlistsCollectionView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 4)
        ])
    }
    
}
