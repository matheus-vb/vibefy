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
    let bottomLabelContainer = UIView()
    let firstStackView = UIStackView()
    let secondStackView = UIStackView()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .light)]
        let pieces = ["Cansou dos ", "mesmos ", "rolês"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        attributedPieces.append(NSMutableAttributedString(string: pieces[1], attributes: boldAttrs))
        attributedPieces.append(NSMutableAttributedString(string: pieces[2], attributes: normalAttrs))
        label.attributedText = attributedPieces
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Vibefy te leva a novos bares e restaurantes."
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "deslize para o lado"
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.numberOfLines = 1
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
        setupFirstStack()
        setupSecondStack()
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
        bottomLabelContainer.addSubview(bottomLabel)
        
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
        NSLayoutConstraint.activate(         [imageOne.topAnchor.constraint(equalTo:imageOneContainer.topAnchor, constant: 8.0),
                                     imageOne.centerXAnchor.constraint(equalTo: imageOneContainer.centerXAnchor),
                                     imageOne.centerYAnchor.constraint(equalTo: imageOneContainer.centerYAnchor)
                                    ])
        NSLayoutConstraint.activate([bottomLabel.centerXAnchor.constraint(equalTo: bottomLabelContainer.centerXAnchor),
                                     bottomLabel.centerYAnchor.constraint(equalTo: bottomLabelContainer.centerYAnchor),
                                     bottomLabel.topAnchor.constraint(equalTo: bottomLabelContainer.topAnchor)
                                    ])
    }
    
    func setupFirstStack(){
        self.view.addSubview(firstStackView)
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        firstStackView.axis = .vertical
        firstStackView.alignment = .fill
        firstStackView.spacing = 16
        firstStackView.addArrangedSubview(titleLabelContainer)
        firstStackView.addArrangedSubview(subtitleLabelContainer)
        firstStackView.addArrangedSubview(imageOneContainer)
    }
    
    func setupSecondStack(){
        self.view.addSubview(secondStackView)
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.axis = .vertical
        secondStackView.alignment = .fill
        secondStackView.spacing = 40
        secondStackView.addArrangedSubview(firstStackView)
        secondStackView.addArrangedSubview(bottomLabelContainer)
        NSLayoutConstraint.activate([
            secondStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            secondStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            secondStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 86)
        ])
    }
}
