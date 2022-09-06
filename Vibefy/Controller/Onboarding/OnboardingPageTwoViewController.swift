//
//  OnboardingPageOneViewController.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import UIKit

class OnboardingPageTwoViewController: UIViewController {

    let titleLabelContainer = UIView()
    let subtitleLabelContainer = UIView()
    let imageTwoContainer = UIView()
    let stackView = UIStackView()
    
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Você é o que você ouve."
        label.font = UIFont(name: label.font.fontName, size: 40)
        label.font = .boldSystemFont(ofSize: 40)
        label.numberOfLines = 3
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Por isso, consultamos o que você ouve no Apple Music."
        label.font = UIFont(name: label.font.fontName, size: 24)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageTwo: UIImageView = {
        let img = UIImage(named: "onBoarding2")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 300, height: 300)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    private lazy var imageTwoBG: UIImageView = {
        let imageName = "BGOnboarding2.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupContainers()
        setupStack()
    }
    
    func setupBackground(){
        view.addSubview(imageTwoBG)
        imageTwoBG.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageTwoBG.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageTwoBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            imageTwoBG.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageTwoBG.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func setupContainers(){
        titleLabelContainer.addSubview(titleLabel)
        subtitleLabelContainer.addSubview(subTitleLabel)
        imageTwoContainer.addSubview(imageTwo)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageTwo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:titleLabelContainer.topAnchor, constant: 8.0),
            titleLabel.bottomAnchor.constraint(equalTo:titleLabelContainer.bottomAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo:titleLabelContainer.leadingAnchor, constant: 16.0),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -41.0)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: subtitleLabelContainer.topAnchor, constant: 8),
            subTitleLabel.bottomAnchor.constraint(equalTo: subtitleLabelContainer.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelContainer.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: subtitleLabelContainer.trailingAnchor, constant: -41)
        ])
        
        NSLayoutConstraint.activate([
            imageTwo.topAnchor.constraint(equalTo: imageTwoContainer.topAnchor, constant: 32),
            imageTwo.leadingAnchor.constraint(equalTo: imageTwoContainer.leadingAnchor, constant: 89.5),
            imageTwo.trailingAnchor.constraint(equalTo: imageTwoContainer.trailingAnchor, constant: -89.5)
        ])
    }
    
    func setupStack(){
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 16
        
        stackView.addArrangedSubview(titleLabelContainer)
        stackView.addArrangedSubview(subtitleLabelContainer)
        stackView.addArrangedSubview(imageTwoContainer)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 86),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
