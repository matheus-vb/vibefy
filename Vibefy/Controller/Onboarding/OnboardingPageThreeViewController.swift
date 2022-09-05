//
//  OnboardingPageOneViewController.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import UIKit

class OnboardingPageThreeViewController: UIViewController {
    
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
        setupImages();
    }
    
    func setupImages(){
        view.addSubview(imageThreeBG)
        view.bringSubviewToFront(imageThreeBG)
        imageThreeBG.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        imageThreeBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        imageThreeBG.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        imageThreeBG.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
}
