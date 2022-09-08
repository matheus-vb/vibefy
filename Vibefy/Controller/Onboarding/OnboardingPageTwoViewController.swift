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
    let bottomLabelContainer = UIView()
    let labelStackView = UIStackView()
    let upperStackView = UIStackView()
    let fullStackView = UIStackView()
    
    
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
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.numberOfLines = 1
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
        setupLabelStack()
        setupFirstStack()
        setupSecondStackView()
        
//        setupViewHierarchy()
//        setupViewAttributes()
//        setupLayout()
    }
    
    func setupViewHierarchy() {
        view.addSubview(imageTwoBG)
        view.addSubview(fullStackView)
        
        //upperStackView.addArrangedSubview(<#T##view: UIView##UIView#>)
    }
    
    func setupViewAttributes() {
        
    }
    
    func setupLayout() {
        
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
        subtitleLabelContainer.addSubview(subtitleLabel)
        imageTwoContainer.addSubview(imageTwo)
        bottomLabelContainer.addSubview(bottomLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo:titleLabelContainer.topAnchor, constant: 8.0),
            titleLabel.bottomAnchor.constraint(equalTo:titleLabelContainer.bottomAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo:titleLabelContainer.leadingAnchor, constant: 16.0),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -41.0)
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: subtitleLabelContainer.topAnchor, constant: 8),
            subtitleLabel.bottomAnchor.constraint(equalTo: subtitleLabelContainer.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelContainer.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: subtitleLabelContainer.trailingAnchor, constant: -41)
        ])
        
        NSLayoutConstraint.activate([
            imageTwo.topAnchor.constraint(equalTo: imageTwoContainer.topAnchor, constant: 32),
            imageTwo.centerXAnchor.constraint(equalTo: imageTwoContainer.centerXAnchor),
            imageTwo.centerYAnchor.constraint(equalTo: imageTwoContainer.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.centerXAnchor.constraint(equalTo: bottomLabelContainer.centerXAnchor),
            bottomLabel.centerYAnchor.constraint(equalTo: bottomLabelContainer.centerYAnchor),
            bottomLabel.topAnchor.constraint(equalTo: bottomLabelContainer.topAnchor)
        ])
    }
    
    func setupLabelStack(){
        labelStackView.axis = .vertical
        labelStackView.alignment = .fill
        labelStackView.spacing = 16
        labelStackView.addArrangedSubview(titleLabelContainer)
        labelStackView.addArrangedSubview(subtitleLabelContainer)
    }
    
    func setupFirstStack(){
        upperStackView.axis = .vertical
        upperStackView.alignment = .fill
        upperStackView.spacing = 44
        
        upperStackView.addArrangedSubview(labelStackView)
        upperStackView.addArrangedSubview(imageTwoContainer)
    }
    
    func setupSecondStackView(){
        self.view.addSubview(fullStackView)
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        fullStackView.axis = .vertical
        fullStackView.alignment = .fill
        fullStackView.spacing = 62
        fullStackView.addArrangedSubview(upperStackView)
        fullStackView.addArrangedSubview(bottomLabelContainer)
        NSLayoutConstraint.activate([
            fullStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            fullStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 86)
        ])
    }
}
