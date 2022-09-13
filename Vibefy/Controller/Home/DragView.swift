//
//  DragView.swift
//  Vibefy
//
//  Created by matheusvb on 12/09/22.
//

import UIKit

class DragView: UIView {
    
    let recentsLabelContainer: UIView = UIView()
    let popupStackView: UIStackView = UIStackView()
    let recentesCollectionViewContainer: UIView = UIView()
    
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
        self.addSubview(popupStackView)
        
        self.popupStackView.addSubview(recentsLabelContainer)
        self.popupStackView.addSubview(recentesCollectionViewContainer)
        
        self.recentsLabelContainer.addSubview(recentsLabel)
        self.recentesCollectionViewContainer.addSubview(recentsCollectionView)
    }
    
    func setupViewAttributes(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1.0)
        self.layer.cornerRadius = 40
        self.isUserInteractionEnabled = true
        
        self.popupStackView.axis = .vertical
        self.popupStackView.alignment = .fill
        self.popupStackView.distribution = .fill
        self.popupStackView.spacing = 16
     }
    
    func setupLayout(){
        
        popupStackView.translatesAutoresizingMaskIntoConstraints = false
        recentsLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        recentesCollectionViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popupStackView.topAnchor.constraint(equalTo: self.topAnchor),
            popupStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            popupStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            popupStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            recentsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            recentsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            recentsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            recentsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            recentsCollectionView.leadingAnchor.constraint(equalTo: self.recentesCollectionViewContainer.leadingAnchor, constant: 0),
            recentsCollectionView.topAnchor.constraint(equalTo: self.recentsCollectionView.topAnchor, constant: 0),
            recentsCollectionView.trailingAnchor.constraint(equalTo: self.recentsCollectionView.trailingAnchor, constant: 0),
            recentsCollectionView.bottomAnchor.constraint(equalTo: self.recentsCollectionView.bottomAnchor, constant: 0),
            recentsCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
