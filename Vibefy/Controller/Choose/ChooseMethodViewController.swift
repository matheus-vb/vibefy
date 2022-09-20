//
//  ChooseMethodViewController.swift
//  Vibefy
//
//  Created by Bof on 15/09/22.
//

import UIKit

class ChooseMethodViewController: UIViewController {
    let titleLabelContainer = UIView()
    let subtitleLabelContainer = UIView()
    
    let labelStackView = UIStackView()
    let buttonsStackView = UIStackView()
    let lowerStackView = UIStackView()
    let completeStackView = UIStackView()
    
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        let text = "Que músicas usaremos?"
        let textAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .light)]
        label.attributedText = NSMutableAttributedString(string: text, attributes: textAttr)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        let text = "Escolha a fonte pra nossas recomendações."
        let textAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .light)]
        label.attributedText = NSMutableAttributedString(string: text, attributes: textAttr)
        label.numberOfLines = 3
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var backButton: UIButton = {
//        let button = UIButton()
//        let bgImage = UIImage(named: "backButton")
//        let bgImageView = UIImageView(image: bgImage)
//        button.setBackgroundImage(UIImage(named: "backButton"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    private lazy var recentButton: UIButton = {
        let button = UIButton()
        let bgImage = UIImage(named: "recentButton")
        let bgImageView = UIImageView(image: bgImage)
        button.setBackgroundImage(UIImage(named: "recentButton"), for: .normal)
        button.layer.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width*(255/812), height: self.view.frame.height*(255/812))
        bgImageView.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToLoadingScreen), for: .touchUpInside)
        return button
    }()
    
    private lazy var inspoButton: UIButton = {
        let button = UIButton()
        let bgImage = UIImage(named: "inspoButton")
        let bgImageView = UIImageView(image: bgImage)
        button.setBackgroundImage(UIImage(named: "inspoButton"), for: .normal)
        button.layer.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width*(255/812), height: self.view.frame.height*(255/812))
        bgImageView.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToSelectScreen), for: .touchUpInside)
        return button
    }()
    
    private lazy var choiceBG: UIImageView = {
        let imageName = "BGChoose"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y:0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        
        setupHierarchy()
        setupAttributes()
        setupViewsLayout()
    }
    
    func setupHierarchy() {
        view.addSubview(choiceBG)
        view.addSubview(completeStackView)

        completeStackView.addSubview(lowerStackView)
        
        lowerStackView.addArrangedSubview(labelStackView)
        lowerStackView.addArrangedSubview(buttonsStackView)
        
        labelStackView.addSubview(titleLabelContainer)
        labelStackView.addSubview(subtitleLabelContainer)
        
        
        buttonsStackView.addSubview(recentButton)
        buttonsStackView.addSubview(inspoButton)
        
        titleLabelContainer.addSubview(titleLabel)
        subtitleLabelContainer.addSubview(subtitleLabel)
    }
    
    func setupAttributes() {
        
        lowerStackView.axis = .vertical
        lowerStackView.alignment = .fill
        lowerStackView.distribution = .fill
        lowerStackView.spacing = 8
        
        labelStackView.axis = .vertical
        labelStackView.alignment = .fill
        labelStackView.distribution = .fill
        labelStackView.spacing = 4
        
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fill
        buttonsStackView.spacing = 4
        
    }
    
    func setupViewsLayout() {
        
        choiceBG.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            choiceBG.topAnchor.constraint(equalTo: view.topAnchor),
            choiceBG.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            choiceBG.leftAnchor.constraint(equalTo: view.leftAnchor),
            choiceBG.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleLabelContainer.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -44)
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: subtitleLabelContainer.topAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: subtitleLabelContainer.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelContainer.leadingAnchor, constant: 32),
            subtitleLabel.trailingAnchor.constraint(equalTo: subtitleLabelContainer.trailingAnchor, constant: -44)
        ])
        
        NSLayoutConstraint.activate([
            titleLabelContainer.centerXAnchor.constraint(equalTo: labelStackView.centerXAnchor),
            titleLabelContainer.topAnchor.constraint(equalTo: labelStackView.topAnchor),
            titleLabelContainer.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor),
            titleLabelContainer.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor)
        ])
        
        titleLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitleLabelContainer.centerXAnchor.constraint(equalTo: labelStackView.centerXAnchor),
            subtitleLabelContainer.topAnchor.constraint(equalTo: titleLabelContainer.bottomAnchor, constant: 4),
            subtitleLabelContainer.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor),
            subtitleLabelContainer.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor)
        ])
        
        lowerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        completeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            completeStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            completeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            completeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            completeStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            completeStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            lowerStackView.centerYAnchor.constraint(equalTo: completeStackView.centerYAnchor),
            lowerStackView.leadingAnchor.constraint(equalTo: completeStackView.leadingAnchor),
            lowerStackView.trailingAnchor.constraint(equalTo: completeStackView.trailingAnchor),
            lowerStackView.topAnchor.constraint(equalTo: completeStackView.topAnchor),
            lowerStackView.bottomAnchor.constraint(equalTo: completeStackView.bottomAnchor)
        ])
                
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: lowerStackView.topAnchor, constant: (18/812)*self.view.frame.height),
            labelStackView.centerYAnchor.constraint(equalTo: lowerStackView.centerYAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: lowerStackView.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: lowerStackView.trailingAnchor)
        ])
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: lowerStackView.topAnchor, constant: (120/812)*self.view.frame.height),
            buttonsStackView.centerXAnchor.constraint(equalTo: lowerStackView.centerXAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: lowerStackView.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: lowerStackView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            recentButton.topAnchor.constraint(equalTo: buttonsStackView.topAnchor),
            recentButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor, constant: 127),
            inspoButton.topAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: (260/812)*self.view.frame.height),
            inspoButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor)
        ])
    }
    
    @objc func goToLoadingScreen(_ sender: UIButton) {
        let rootViewController = LoadingPageViewController()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.pushViewController(rootViewController, animated: true)
    }
    
    @objc func goToSelectScreen(_ sender: UIButton) {
        let rootViewController = ChoiceViewController()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.pushViewController(rootViewController, animated: true)
    }
    
}
