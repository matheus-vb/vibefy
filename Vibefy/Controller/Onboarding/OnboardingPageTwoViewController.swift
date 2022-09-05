//
//  OnboardingPageTwoViewController.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import UIKit

class OnboardingPageTwoViewController: UIViewController {

    private lazy var imageOne: UIImageView = {
        let img = UIImage(named: "onBoarding2")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 300, height: 300)
        return imgV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        setupPositions()
    }
    
    func setupPositions(){
        view.addSubview(imageOne)
        imageOne.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageOne.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageOne.translatesAutoresizingMaskIntoConstraints = false
    }
}
