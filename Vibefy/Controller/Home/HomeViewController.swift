//
//  HomeViewController.swift
//  Vibefy
//
//  Created by matheusvb on 04/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let titleLabelContainer = UIView()
    let buttonContainer = UIView()
    
    let stackView = UIStackView()
    
    //let dragView = UIView()
    let dragView = DragView()
    
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .light)]
        let pieces = ["Como está sua ", "vibe ", "hoje?"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        attributedPieces.append(NSMutableAttributedString(string: pieces[1], attributes: boldAttrs))
        attributedPieces.append(NSMutableAttributedString(string: pieces[2], attributes: normalAttrs))
        label.attributedText = attributedPieces
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private lazy var homeButton: UIButton = {
        let button = UIButton()
        let bgImage = UIImage(named: "ButtonHome")
        let bgImageView = UIImageView(image: bgImage)
        button.setBackgroundImage(UIImage(named: "ButtonHome"), for: .normal)
        button.layer.frame = CGRect(x: 0.0, y: 0.0, width: bgImageView.frame.width, height: bgImageView.frame.height)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    private lazy var homeBG: UIImageView = {
        let imageName = "BGhome.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var isDragging = false
    
    var fileViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
        dragViewSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dragView.center = view.center
    }
    
    func setupViewHierarchy() {
        view.addSubview(homeBG)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabelContainer)
        stackView.addArrangedSubview(buttonContainer)
        
        titleLabelContainer.addSubview(titleLabel)
        buttonContainer.addSubview(homeButton)
        
//        titleLabelContainer.backgroundColor = .red
//        buttonContainer.backgroundColor = .green
//        stackView.backgroundColor = .link
    }
    
    func setupViewAttributes() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 40
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            homeBG.topAnchor.constraint(equalTo: self.view.topAnchor),
            homeBG.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            homeBG.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            homeBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            homeButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor, constant: 59.5),
            homeButton.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor, constant: -59.5),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -41),
            titleLabel.centerYAnchor.constraint(equalTo: titleLabelContainer.centerYAnchor),
            titleLabelContainer.heightAnchor.constraint(equalToConstant: 98)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 134),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func dragViewSetup() {
        dragView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        dragView.center = view.center
        dragView.layer.cornerRadius = 40
        view.addSubview(dragView)
        
    }
}
