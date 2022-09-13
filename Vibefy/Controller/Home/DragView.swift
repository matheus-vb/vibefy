//
//  DragView.swift
//  Vibefy
//
//  Created by matheusvb on 12/09/22.
//

import UIKit

class DragView: UIView {
    
    let recentsLabelContainer: UIView = UIView()
    private let recentsCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isUserInteractionEnabled = false
        return collectionView
    }()
        
    lazy var recentsLabel: UILabel = {
        let label: UILabel = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .light)]
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
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .light)]
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
            
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        self.recentsLabelContainer.addSubview(recentsLabel)
        
        self.addSubview(recentsLabelContainer)
        self.addSubview(recentsCollectionView)
    }
    
    func setupViewAttributes(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1.0)
        self.layer.cornerRadius = 40
        self.isUserInteractionEnabled = true
        
    }
    
    func setupLayout(){
        
        
        recentsLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recentsLabelContainer.heightAnchor.constraint(equalTo: self.recentsLabel.heightAnchor),
            recentsLabelContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -113),
            recentsLabelContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            recentsLabelContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 54)
        ])
        
        NSLayoutConstraint.activate([
            recentsLabel.leadingAnchor.constraint(equalTo: self.recentsLabelContainer.leadingAnchor, constant: 24),
            recentsLabel.trailingAnchor.constraint(equalTo: self.recentsLabelContainer.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            recentsCollectionView.leadingAnchor.constraint(equalTo:  self.leadingAnchor, constant: 24),
            recentsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            recentsCollectionView.topAnchor.constraint(equalTo: self.recentsLabelContainer.bottomAnchor, constant: 8),
            recentsCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
