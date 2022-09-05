//
//  OnboardingPageOneViewController.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import UIKit

class OnboardingPageOneViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Cansou dos mesmos roles?"
        label.font = UIFont(name: label.font.fontName, size: 36)
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
        setupImages()
        setupLabels()
    }
    
    func setupImages(){
        view.addSubview(imageOneBG)
        view.bringSubviewToFront(imageOneBG)
        view.addSubview(imageOne)
        imageOne.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageOne.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageOneBG.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        imageOneBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        imageOneBG.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        imageOneBG.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
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
    
}
