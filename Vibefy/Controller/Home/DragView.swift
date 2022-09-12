//
//  DragView.swift
//  Vibefy
//
//  Created by matheusvb on 12/09/22.
//

import UIKit

class DragView: UIView {
    
    var collectionRecents: UICollectionView!
    var cellID = "Cell"
    
    lazy var recentsLabel: UILabel = {
        let label: UILabel = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .light)]
        let pieces = ["Locais vistos"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var favoritesLabel: UILabel = {
        let label = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .light)]
        let pieces = ["Favoritos"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1.0)
        layer.cornerRadius = 40
                
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        
    }
    
    func setupViewAttributes(){
        
    }
    
    func setupLayout(){
 
    }
    
}
