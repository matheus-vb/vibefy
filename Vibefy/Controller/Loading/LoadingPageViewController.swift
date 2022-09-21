//
//  LoadingPageViewController.swift
//  Vibefy
//
//  Created by jpcm2 on 17/09/22.
//

import UIKit

class LoadingPageViewController: UIViewController {

    let titleLabelContainer = UIView()
    let subTitleLabelContainer = UIView()
    let labelsStackView = UIStackView()
    var bubblesImages = [UIImageView()]
    let numberOfbubbles = 6
    
    private lazy var loadingBG: UIImageView = {
        let imagePath = "loadingBG.png"
        let img = UIImage(named: imagePath)
        let imgV = UIImageView()
        imgV.image = img
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    private lazy var bubbleImg1: UIImageView = {
        let img = UIImage(named: "firstbubbleImage")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: -100, y: 50, width: 83, height: 83)
        
        
        return imgView
    }()
    
    private lazy var bubbleImg2: UIImageView = {
        let img = UIImage(named: "secondbubbleImage")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: -100, y: 200, width: 83, height: 83)
        
        
        return imgView
    }()
    
    private lazy var bubbleImg3: UIImageView = {
        let img = UIImage(named: "thirdbubbleImage")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: -100, y: 300, width: 83, height: 83)
        
        
        return imgView
    }()
    
    private lazy var bubbleImg4: UIImageView = {
        let img = UIImage(named: "firstbubbleImage")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: -100, y: 450, width: 83, height: 83)
        
        
        return imgView
    }()
    
    private lazy var bubbleImg5: UIImageView = {
        let img = UIImage(named: "secondbubbleImage")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: -100, y: 550, width: 83, height: 83)
        
        
        return imgView
    }()
    
    private lazy var bubbleImg6: UIImageView = {
        let img = UIImage(named: "thirdbubbleImage")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: -100, y: 650, width: 83, height: 83)
        
        
        return imgView
    }()
    
    private lazy var loadingTitle: UILabel = {
        let label = UILabel()
        label.text = "Calculando..."
        label.font = UIFont.systemFont(ofSize: 36, weight: .light)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loadingSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Ouvindo tudo o que você gosta."
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        setupViewAttributes()
        setupViewHierarchy()
        setupLayout()
        
        //setupAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.addSubview(bubbleImg1)
        view.addSubview(bubbleImg2)
        view.addSubview(bubbleImg3)
        view.addSubview(bubbleImg4)
        view.addSubview(bubbleImg5)
        view.addSubview(bubbleImg6)
        
        animateBubble(aView: self.bubbleImg1)
        animateBubble(aView: self.bubbleImg2)
        animateBubble(aView: self.bubbleImg3)
        animateBubble(aView: self.bubbleImg4)
        animateBubble(aView: self.bubbleImg5)
        animateBubble(aView: self.bubbleImg6)
        
        view.bringSubviewToFront(labelsStackView)
    }
    
    func moveBubble(mView: UIImageView) {
       
        let randomX = CGFloat.random(in: 200..<450)
        let randomY = CGFloat.random(in: -60..<60)
        
        mView.center.x = mView.center.x + randomX
        mView.center.y = mView.center.y + randomY
    }
    
    func animateBubble(aView: UIImageView) {
        let duration = Double.random(in: 2..<8)
        
        UIImageView.animate(withDuration: duration){
            self.moveBubble(mView: aView)
        }
    }
    
    
    func setupViewHierarchy(){
        self.view.addSubview(loadingBG)
        
//        for i in 0...numberOfbubbles{
//            view.addSubview(bubblesImages[i])
//            view.bringSubviewToFront(bubblesImages[i])
//        }
        
        self.view.addSubview(labelsStackView)
        
        labelsStackView.addArrangedSubview(titleLabelContainer)
        labelsStackView.addArrangedSubview(subTitleLabelContainer)
        
        titleLabelContainer.addSubview(loadingTitle)
        subTitleLabelContainer.addSubview(loadingSubTitle)
        
    }
    
    func setupViewAttributes(){
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .vertical
        labelsStackView.alignment = .fill
        labelsStackView.distribution = .fill
        labelsStackView.spacing = 0
        
//        for i in 0...numberOfbubbles{
//            let imgV = UIImageView()
//            let buff = Double.random(in: -60.00...60.00)
//            if(i % 3 == 0){
//                imgV.image = UIImage(named: "firstbubbleImage")
//                imgV.frame = CGRect(x: Double(i)*self.view.frame.width/6, y: Double(i)*self.view.frame.height/6 + buff, width: 83, height: 83)
//                bubblesImages.append(imgV)
//            }else if(i % 3 == 1){
//                imgV.image = UIImage(named: "secondbubbleImage")
//                imgV.frame = CGRect(x: Double(i)*self.view.frame.width/6, y: Double(i)*self.view.frame.height/6 + buff, width: 83, height: 83)
//                bubblesImages.append(imgV)
//            }else{
//                imgV.image = UIImage(named: "thirdbubbleImage")
//                imgV.frame = CGRect(x: Double(i)*self.view.frame.width/6, y: Double(i)*self.view.frame.height/6 + buff, width: 83, height: 83)
//                bubblesImages.append(imgV)
//            }
//        }
    }
    
    func setupLayout(){
        
        NSLayoutConstraint.activate([
            loadingBG.topAnchor.constraint(equalTo: self.view.topAnchor),
            loadingBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            loadingBG.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loadingBG.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loadingTitle.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor, constant: 8),
            loadingTitle.bottomAnchor.constraint(equalTo: titleLabelContainer.bottomAnchor, constant: -8),
            loadingTitle.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -16),
            loadingTitle.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            loadingSubTitle.topAnchor.constraint(equalTo: subTitleLabelContainer.topAnchor, constant: 8),
            loadingSubTitle.bottomAnchor.constraint(equalTo: subTitleLabelContainer.bottomAnchor, constant: -8),
            loadingSubTitle.trailingAnchor.constraint(equalTo: subTitleLabelContainer.trailingAnchor, constant: -16),
            loadingSubTitle.leadingAnchor.constraint(equalTo: subTitleLabelContainer.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            labelsStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 11),
            labelsStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12),
            labelsStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 140*self.view.frame.height/812)
        ])
    }
}
