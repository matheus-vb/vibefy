//
//  DragView.swift
//  Vibefy
//
//  Created by matheusvb on 12/09/22.
//

import UIKit

class DragView: UIView {
    
    let recentsLabelContainer: UIView = UIView()
    let favoritesLabelContainer: UIView = UIView()
    let popupStackView: UIStackView = UIStackView()
    let recentesCollectionViewContainer: UIView = UIView()
    let favoriteCollecitonViewContainer: UIView = UIView()
    let barContainer: UIView = UIView()
    
    private lazy var barImg: UIImageView = {
        let img = UIImage(named: "dragBar")
        let imgV = UIImageView(image: img)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit

        return imgV
    }()
    
    lazy var recentsCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.itemSize = CGSize(width: 200, height: 170)
        viewLayout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: viewLayout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20.5, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(RecentsCollectionViewCell.self, forCellWithReuseIdentifier: RecentsCollectionViewCell.id)
        collectionView.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1.0)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.isUserInteractionEnabled = false
        return collectionView
    }()
    
    lazy var favoritesCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.itemSize = CGSize(width: 100, height: 100)
        viewLayout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: viewLayout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: FavoritesCollectionViewCell.id)
        collectionView.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1.0)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.isUserInteractionEnabled = false
        return collectionView
    }()
        
    lazy var recentsLabel: UILabel = {
        let label: UILabel = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .semibold)]
        let pieces = ["Locais vistos"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    lazy var favoritesLabel: UILabel = {
        let label = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .semibold)]
        let pieces = ["Favoritos"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
        recentsCollectionView.dataSource = self
        recentsCollectionView.delegate = self
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.delegate = self
        
        
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        
        self.addSubview(popupStackView)
        
        popupStackView.addSubview(barContainer)
        popupStackView.addSubview(recentsLabelContainer)
        popupStackView.addSubview(recentesCollectionViewContainer)
        popupStackView.addArrangedSubview(favoritesLabelContainer)
        popupStackView.addArrangedSubview(favoriteCollecitonViewContainer)
        
        
        popupStackView.bringSubviewToFront(recentesCollectionViewContainer)
        popupStackView.bringSubviewToFront(favoriteCollecitonViewContainer)
        
        barContainer.addSubview(barImg)
        self.recentsLabelContainer.addSubview(recentsLabel)
        self.recentesCollectionViewContainer.addSubview(recentsCollectionView)
        favoritesLabelContainer.addSubview(favoritesLabel)
        favoriteCollecitonViewContainer.addSubview(favoritesCollectionView)
        
//        favoritesLabelContainer.backgroundColor = .green
//        favoriteCollecitonViewContainer.backgroundColor = .cyan
        
    }
    
    func setupViewAttributes(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)
        self.layer.cornerRadius = 40
        self.isUserInteractionEnabled = true
        
        self.popupStackView.axis = .vertical
        self.popupStackView.alignment = .fill
        //self.popupStackView.distribution = .fill
        self.popupStackView.spacing = 0
        
     }
    
    func setupLayout(){
        
        popupStackView.translatesAutoresizingMaskIntoConstraints = false
        recentsLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        recentesCollectionViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            barImg.centerXAnchor.constraint(equalTo: centerXAnchor),
            barImg.topAnchor.constraint(equalTo: barContainer.topAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            popupStackView.topAnchor.constraint(equalTo: self.topAnchor),
            popupStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            popupStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            popupStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            recentsLabel.leadingAnchor.constraint(equalTo: recentsLabelContainer.leadingAnchor, constant: 32),
            recentsLabel.topAnchor.constraint(equalTo: recentsLabelContainer.topAnchor, constant: 54),
            recentsLabel.trailingAnchor.constraint(equalTo: recentsLabelContainer.trailingAnchor, constant: -16),
            recentsLabel.bottomAnchor.constraint(equalTo: recentsLabelContainer.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            recentsCollectionView.topAnchor.constraint(equalTo: recentesCollectionViewContainer.topAnchor),
            recentsCollectionView.bottomAnchor.constraint(equalTo: recentesCollectionViewContainer.bottomAnchor),
            recentsCollectionView.leadingAnchor.constraint(equalTo: recentesCollectionViewContainer.leadingAnchor),
            recentsCollectionView.trailingAnchor.constraint(equalTo: recentesCollectionViewContainer.trailingAnchor),
            recentesCollectionViewContainer.heightAnchor.constraint(equalToConstant: 150),
            recentesCollectionViewContainer.widthAnchor.constraint(equalTo: widthAnchor),
            recentesCollectionViewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 96)
        ])
        
        NSLayoutConstraint.activate([
            favoritesLabelContainer.heightAnchor.constraint(equalToConstant: 40),
            favoritesLabelContainer.widthAnchor.constraint(equalTo: widthAnchor),
            favoritesLabelContainer.topAnchor.constraint(equalTo: topAnchor, constant: 250),
            favoritesLabel.leadingAnchor.constraint(equalTo: favoritesLabelContainer.leadingAnchor, constant: 32),
            favoritesLabel.trailingAnchor.constraint(equalTo: favoritesLabelContainer.trailingAnchor, constant: -16),
            favoritesLabel.centerYAnchor.constraint(equalTo: favoritesLabelContainer.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            favoritesCollectionView.topAnchor.constraint(equalTo: favoriteCollecitonViewContainer.topAnchor),
            favoritesCollectionView.leadingAnchor.constraint(equalTo: favoriteCollecitonViewContainer.leadingAnchor),
            favoritesCollectionView.trailingAnchor.constraint(equalTo: favoriteCollecitonViewContainer.trailingAnchor),
            favoritesCollectionView.bottomAnchor.constraint(equalTo: favoriteCollecitonViewContainer.bottomAnchor),
            favoriteCollecitonViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        ])
    }
}
