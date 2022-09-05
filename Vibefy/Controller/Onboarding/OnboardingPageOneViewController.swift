//
//  OnboardingPageOneViewController.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import UIKit

class OnboardingPageOneViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let view  = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var squareView: UIView = {
        let view  = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var imageOne: UIImageView = {
        let img = UIImage(named: "onBoarding1")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 240, height: 300)
        return imgV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupElements();
        setupPositions();
    }
    
    
    func setupElements(){
        squareView.backgroundColor = .black
    }
    
    func setupPositions(){
        view.addSubview(imageOne)
        imageOne.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageOne.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageOne.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        imageOne.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
    }
}
