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
    let skipButtonContainer = UIView()
    
    let upperStackView = UIStackView()
    let fullStackView = UIStackView()
    
    
    private var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .light)]
        let pieces = ["Cansou dos ", "mesmos ", "rolês?"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        attributedPieces.append(NSMutableAttributedString(string: pieces[1], attributes: boldAttrs))
        attributedPieces.append(NSMutableAttributedString(string: pieces[2], attributes: normalAttrs))
        label.attributedText = attributedPieces
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
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
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    
    //MARK: - HIERARQUIA VIEWS
    
    
    func setupViewHierarchy() {
        view.addSubview(imageOneBG)
        view.addSubview(fullStackView)
        
        upperStackView.addArrangedSubview(skipButtonContainer)
        upperStackView.addArrangedSubview(titleLabelContainer)
        upperStackView.addArrangedSubview(subtitleLabelContainer)
        upperStackView.addArrangedSubview(imageOneContainer)
        
        fullStackView.addArrangedSubview(upperStackView)
        fullStackView.addArrangedSubview(bottomLabelContainer)
        
        skipButtonContainer.addSubview(skipButton)
        titleLabelContainer.addSubview(titleLabel)
        subtitleLabelContainer.addSubview(subtitleLabel)
        imageOneContainer.addSubview(imageOne)
        
//        titleLabelContainer.backgroundColor = .red
//        subtitleLabelContainer.backgroundColor = .green
//        imageOneContainer.backgroundColor = .blue
        
        bottomLabelContainer.addSubview(bottomLabel)
    }
    
    //MARK: - ATRIBUTOS STACKS
    
    func setupViewAttributes() {
        upperStackView.axis = .vertical
        upperStackView.alignment = .fill
        upperStackView.spacing = 0
        
        fullStackView.axis = .vertical
        fullStackView.alignment = .fill
        fullStackView.spacing = 40
        
    }
    
    //MARK: - LAYOUT
    
    func setupLayout() {
        
        imageOneBG.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageOneBG.topAnchor.constraint(equalTo: view.topAnchor),
            imageOneBG.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageOneBG.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageOneBG.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipButtonContainer.heightAnchor.constraint(equalToConstant: 140),
            skipButton.centerXAnchor.constraint(equalTo: skipButtonContainer.centerXAnchor),
            skipButton.centerYAnchor.constraint(equalTo: skipButtonContainer.centerYAnchor)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([//titleLabel.topAnchor.constraint(equalTo:titleLabelContainer.topAnchor, constant: 8.0),
                                     //titleLabel.bottomAnchor.constraint(equalTo:titleLabelContainer.bottomAnchor, constant: 8.0),
                                     titleLabel.centerYAnchor.constraint(equalTo: titleLabelContainer.centerYAnchor),
                                     titleLabel.leadingAnchor.constraint(equalTo:titleLabelContainer.leadingAnchor, constant: 16.0),
                                     titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -41.0)
                                    ])
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([subtitleLabel.topAnchor.constraint(equalTo:subtitleLabelContainer.topAnchor, constant: -16),
                                     subtitleLabel.bottomAnchor.constraint(equalTo:subtitleLabelContainer.bottomAnchor, constant: 0),
                                     subtitleLabel.leadingAnchor.constraint(equalTo:subtitleLabelContainer.leadingAnchor, constant: 16.0),
                                     subtitleLabel.trailingAnchor.constraint(equalTo: subtitleLabelContainer.trailingAnchor, constant: -41.0)
                                    ])
        
        imageOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageOne.topAnchor.constraint(equalTo:imageOneContainer.topAnchor, constant: 8.0),
                                     imageOne.centerXAnchor.constraint(equalTo: imageOneContainer.centerXAnchor),
                                     imageOne.centerYAnchor.constraint(equalTo: imageOneContainer.centerYAnchor)
                                    ])
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bottomLabel.centerXAnchor.constraint(equalTo: bottomLabelContainer.centerXAnchor),
                                     //bottomLabel.centerYAnchor.constraint(equalTo: bottomLabelContainer.centerYAnchor),
                                     bottomLabel.topAnchor.constraint(equalTo: bottomLabelContainer.topAnchor),
                                     bottomLabel.bottomAnchor.constraint(equalTo: bottomLabelContainer.bottomAnchor)
                                    ])
        
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            fullStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            fullStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -160)
        ])
    }
}
