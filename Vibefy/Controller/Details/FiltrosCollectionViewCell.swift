//
//  FiltrosCollectionViewCell.swift
//  Vibefy
//
//  Created by jpcm2 on 20/09/22.
//

import UIKit

class FiltrosCollectionViewCell: UICollectionViewCell {
    
    static let id = "FiltrosCell"
    
    let filtroLabelContainer = UIView()
    
    private lazy var filtrosView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 194/255, green: 192/255, blue: 255/255, alpha: 1)
        view.frame = CGRect(x: 0, y: 0, width: 85, height: 32)
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var filtroLabel: UILabel = {
        let label: UILabel = UILabel()
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)]
        let pieces = ["sem glúten"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupViewAttributes()
    }
    
    func setupViewHierarchy(){
        self.addSubview(filtrosView)
        filtrosView.addSubview(filtroLabelContainer)
        filtroLabelContainer.addSubview(filtroLabel)
    }
    
    func setupViewAttributes(){
        filtroLabelContainer.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            filtrosView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            filtrosView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            filtrosView.widthAnchor.constraint(equalTo: self.widthAnchor),
            filtrosView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            filtroLabelContainer.centerXAnchor.constraint(equalTo: filtrosView.centerXAnchor),
            filtroLabelContainer.centerYAnchor.constraint(equalTo: filtrosView.centerYAnchor),
            filtroLabelContainer.widthAnchor.constraint(equalTo: filtrosView.widthAnchor),
            filtroLabelContainer.heightAnchor.constraint(equalTo: filtrosView.heightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            filtroLabel.topAnchor.constraint(equalTo: filtroLabelContainer.topAnchor, constant: 9),
            filtroLabel.bottomAnchor.constraint(equalTo: filtroLabelContainer.bottomAnchor, constant: -9),
            filtroLabel.leadingAnchor.constraint(equalTo: filtroLabelContainer.leadingAnchor, constant: 12),
            filtroLabel.trailingAnchor.constraint(equalTo: filtroLabelContainer.trailingAnchor, constant: -12)
        ])
    }
}
