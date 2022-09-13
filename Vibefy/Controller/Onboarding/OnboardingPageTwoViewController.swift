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
    let imageOneContainer = UIView()
    let bottomLabelContainer = UIView()
    
    let labelsStackView = UIStackView()
    let upperStackView = UIStackView()
    
    let labelsContainer = UIView()
    
    let fullStackView = UIStackView()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.frame = CGRect(x: 2.0, y: 0.0, width: 52, height: 32)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .light)]
        let pieces = ["Você é o que você ", "ouve. ", "Sabemos disso."]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        attributedPieces.append(NSMutableAttributedString(string: pieces[1], attributes: boldAttrs))
        attributedPieces.append(NSMutableAttributedString(string: pieces[2], attributes: normalAttrs))
        label.attributedText = attributedPieces
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Por isso, consultamos o que você ouve no Apple Music."
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "deslize para o lado"
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageOne: UIImageView = {
        let img = UIImage(named: "onBoarding2")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 300, height: 300)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit
        return imgV
    }()
    
    private lazy var imageOneBG: UIImageView = {
        let imageName = "BGOnboarding2.png"
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
        view.addSubview(skipButton)
        view.addSubview(fullStackView)
        
        fullStackView.addArrangedSubview(upperStackView)
        fullStackView.addArrangedSubview(bottomLabelContainer)
                
        upperStackView.addArrangedSubview(labelsContainer)
        upperStackView.addArrangedSubview(imageOneContainer)
        
        labelsStackView.addArrangedSubview(titleLabelContainer)
        labelsStackView.addArrangedSubview(subtitleLabelContainer)
        
        imageOneContainer.addSubview(imageOne)
        titleLabelContainer.addSubview(titleLabel)
        subtitleLabelContainer.addSubview(subtitleLabel)
        bottomLabelContainer.addSubview(bottomLabel)
        
        labelsContainer.addSubview(labelsStackView)
        
        
    }
    
    //MARK: - ATRIBUTOS STACKS
    
    func setupViewAttributes() {
        
        upperStackView.axis = .vertical
        upperStackView.alignment = .fill
        upperStackView.distribution = .fill
        upperStackView.spacing = 8
        
        labelsStackView.axis = .vertical
        labelsStackView.alignment = .fill
        labelsStackView.distribution = .fill
        labelsStackView.spacing = 0
        
        imageOneContainer.contentMode = .scaleAspectFit
        
        fullStackView.axis = .vertical
        fullStackView.alignment = .fill
        fullStackView.distribution = .fill
        fullStackView.spacing = 40/812*self.view.frame.height
        
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
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: titleLabelContainer.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -16)])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: subtitleLabelContainer.topAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: subtitleLabelContainer.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelContainer.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: subtitleLabelContainer.trailingAnchor, constant: -16)])
                
        NSLayoutConstraint.activate([
            imageOne.topAnchor.constraint(equalTo: imageOneContainer.topAnchor),
            imageOne.bottomAnchor.constraint(equalTo: imageOneContainer.bottomAnchor),
            imageOne.leadingAnchor.constraint(equalTo: imageOneContainer.leadingAnchor, constant: 52),
            imageOne.trailingAnchor.constraint(equalTo: imageOneContainer.trailingAnchor, constant: -52)
            ])
        
        imageOneContainer.translatesAutoresizingMaskIntoConstraints = false
        
        upperStackView.translatesAutoresizingMaskIntoConstraints = false
        
        fullStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            fullStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11.5),
            fullStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -11.5)])
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: labelsContainer.topAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: labelsContainer.bottomAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: labelsContainer.trailingAnchor)
            ])
    
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: bottomLabelContainer.topAnchor),
            bottomLabel.bottomAnchor.constraint(equalTo: bottomLabelContainer.bottomAnchor),
            bottomLabel.centerXAnchor.constraint(equalTo: bottomLabelContainer.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            skipButton.widthAnchor.constraint(equalToConstant: 60),
            skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -51.5),
            skipButton.bottomAnchor.constraint(equalTo: fullStackView.topAnchor, constant: 32),
        ])

        skipButton.addTarget(self.parent, action: #selector(OnboardingViewController.skipTapped(_:)), for: .primaryActionTriggered)
//
//
    }
    
}


