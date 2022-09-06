//
//  OnboardingPageOneViewController.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import UIKit

class OnboardingPageOneViewController: UIViewController {
    
    let titleLabelContainer = UIView()
    let subtitleLabelContainer = UIView()
    let imageOneContainer = UIView()
    let stackView = UIStackView()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Cansou dos mesmos rolês?"
        label.font = UIFont(name: label.font.fontName, size: 40)
        label.font = .boldSystemFont(ofSize: 40)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Vibefy te leva a novos bares e restaurantes."
        label.font = UIFont(name: label.font.fontName, size: 24)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var imageOne: UIImageView = {
        let img = UIImage(named: "onBoarding1")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 300, height: 300)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit
        return imgV
    }()
    
    private lazy var imageOneBG: UIImageView = {
        let imageName = "BGOnboarding1.png"
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
        view.addSubview(imageOneBG)
        view.bringSubviewToFront(imageOneBG)
        imageOneBG.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        imageOneBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        imageOneBG.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        imageOneBG.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
    
    func setupContainers(){
        titleLabelContainer.addSubview(titleLabel)
        subtitleLabelContainer.addSubview(subTitleLabel)
        imageOneContainer.addSubview(imageOne)
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo:titleLabelContainer.topAnchor, constant: 8.0),
                                     titleLabel.bottomAnchor.constraint(equalTo:titleLabelContainer.bottomAnchor, constant: 8.0),
                                     titleLabel.leadingAnchor.constraint(equalTo:titleLabelContainer.leadingAnchor, constant: 16.0),
                                     titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -41.0)
                                    ])
        NSLayoutConstraint.activate([subTitleLabel.topAnchor.constraint(equalTo:subtitleLabelContainer.topAnchor, constant: 8.0),
                                     subTitleLabel.bottomAnchor.constraint(equalTo:subtitleLabelContainer.bottomAnchor, constant: 8.0),
                                     subTitleLabel.leadingAnchor.constraint(equalTo:subtitleLabelContainer.leadingAnchor, constant: 16.0),
                                     subTitleLabel.trailingAnchor.constraint(equalTo: subtitleLabelContainer.trailingAnchor, constant: -41.0)
                                    ])
        NSLayoutConstraint.activate([imageOne.topAnchor.constraint(equalTo:imageOneContainer.topAnchor, constant: 8.0),
                                     imageOne.leadingAnchor.constraint(equalTo:imageOneContainer.leadingAnchor, constant: 63.5),
                                     imageOne.trailingAnchor.constraint(equalTo: imageOneContainer.trailingAnchor, constant: -63.5)
                                    ])
    }
    
    func setupStack(){
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(titleLabelContainer)
        stackView.addArrangedSubview(subtitleLabelContainer)
        stackView.addArrangedSubview(imageOneContainer)
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 86.0).isActive = true
    }
    
}
