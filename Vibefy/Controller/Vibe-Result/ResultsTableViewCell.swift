//
//  ResultsTableViewCell.swift
//  Vibefy
//
//  Created by Bof on 20/09/22.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    
    static let id = "ResultsCell"
    
    var tapped = false
    lazy var labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let titleContainer = UIView()
    let infoContainer = UIView()
    let buttonContainer = UIView()
    
    private lazy var faveButton: UIButton = {
        let button = UIButton()
        let bgImage = UIImage(named: "favorite")
        let bgImageView = UIImageView(image: bgImage)
        button.setBackgroundImage(UIImage(named: "favorite"), for: .normal)
//        button.layer.frame = CGRect(x: 0.0, y: 0.0, width: bgImageView.frame.width, height: bgImageView.frame.height)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(tapFavorite), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var iconImage: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "amanita")
//        imgView.frame = CGRect(x: 0, y: 0, width: 78, height: 78)
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        let text = "Nome do restaurante e se quebrar fica assim"
        let textAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        label.attributedText = NSMutableAttributedString(string: text, attributes: textAttr)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        let text = "Graças\nDrinks & Petiscos  -  $$$"
        let textAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)]
        label.attributedText = NSMutableAttributedString(string: text, attributes: textAttr)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none

        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder not implemented")
    }
    
    func setupHierarchy() {
        contentView.addSubview(iconImage)
        contentView.addSubview(labelsStack)
        contentView.addSubview(buttonContainer)
        
        labelsStack.addArrangedSubview(titleContainer)
        labelsStack.addArrangedSubview(infoContainer)
        
        titleContainer.addSubview(titleLabel)
        infoContainer.addSubview(infoLabel)
        buttonContainer.addSubview(faveButton)
    }
    
    func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        infoContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            iconImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            iconImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            iconImage.rightAnchor.constraint(equalTo: contentView.leftAnchor, constant: 94)
        ])
        
        NSLayoutConstraint.activate([
            labelsStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            labelsStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            labelsStack.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 16),
            labelsStack.widthAnchor.constraint(equalToConstant: 203)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleContainer.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor),
            
            titleContainer.widthAnchor.constraint(equalToConstant: 203)
        ])
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: infoContainer.topAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: infoContainer.bottomAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: infoContainer.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: infoContainer.trailingAnchor),
            
            infoContainer.widthAnchor.constraint(equalToConstant: 203)
        ])
        
        NSLayoutConstraint.activate([
            buttonContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24),
            buttonContainer.widthAnchor.constraint(equalToConstant: 26),
            buttonContainer.heightAnchor.constraint(equalToConstant: 28),
            buttonContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 120),
            contentView.widthAnchor.constraint(equalToConstant: 393)
        ])
    }
    
    @objc func tapFavorite(sender: UIButton) {
        if tapped == false {
            sender.setImage(UIImage(named: "favoriteFill"), for: .normal)
            tapped = true
        }
        else {
            sender.setImage(UIImage(named: "favorite"), for: .normal)
            tapped = false
        }
    }
    
}
