//
//  OnboardingPageOneViewController.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import UIKit

class OnboardingPageThreeViewController: UIViewController {
    
    let shareButtonConteiner = UIView()
    let titleLableConteiner = UIView()
    let subTitleLabelConteiner = UIView()
    let stackView = UIStackView()
    
    private var shareButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 298, height: 52)
        button.setTitle("Compartilhe sua localizacao", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        
        return button
    }
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Sugerimos locais para comer e beber"
        label.font = UIFont(name: label.font.fontName, size: 36)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Sembre com sua vibe musical."
        label.font = UIFont(name: label.font.fontName, size: 24)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var imageThreeBG: UIImageView = {
        let imageName = "BGOnboarding3.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImages()
        setupLabels()
        setupButtons()
    }
    
    func setupBackground(){
        view.addSubview(imageThreeBG)
        imageThreeBG.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageThreeBG.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageThreeBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            imageThreeBG.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            imageThreeBG.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    func setupImages(){
        view.addSubview(imageThreeBG)
        view.bringSubviewToFront(imageThreeBG)
        imageThreeBG.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        imageThreeBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        imageThreeBG.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        imageThreeBG.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
    
    func setupLabels(){
        view.addSubview(subTitleLabel)
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 130.0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 25).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -25.0).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 25).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -25.0).isActive = true
    }
    
    func setupButtons(){
        view.addSubview(shareButton)
        shareButton.center = self.view.center
        
    }
    
}
