//
//  OnboardingPageOneViewController.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import UIKit

class OnboardingPageOneViewController: UIViewController {

    private lazy var labelView: UIView = {
        let lView = UIView(frame: .zero)
        
        let title = UILabel()
        title.text = "Cansou dos mesmos roles?"
        title.frame = CGRect(x: 0, y: 0, width: 296, height: 80)
        title.center = lView.center
        title.font = UIFont(name: title.font.fontName, size: 40)
        title.textColor = .white
        lView.addSubview(title)
        
        return lView
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
        setupView()
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
    
    func setupView(){
        view.addSubview(labelView)
        labelView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //labelView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        labelView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
