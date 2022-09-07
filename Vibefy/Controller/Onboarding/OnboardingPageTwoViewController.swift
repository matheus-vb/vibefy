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
    let firstStackView = UIStackView()
    let secondStackView = UIStackView()
    
    
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
    
    private lazy var subTitleLabel: UILabel = {
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
        setupFirstStack()
        setupSecondStackView()
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
        bottomLabelContainer.addSubview(bottomLabel)
        
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
            imageTwo.centerXAnchor.constraint(equalTo: imageTwoContainer.centerXAnchor),
            imageTwo.centerYAnchor.constraint(equalTo: imageTwoContainer.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.centerXAnchor.constraint(equalTo: bottomLabelContainer.centerXAnchor),
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
        firstStackView.addArrangedSubview(imageTwoContainer)
    }
    
    func setupSecondStackView(){
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
