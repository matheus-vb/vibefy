//
//  ConfirmViewController.swift
//  Vibefy
//
//  Created by Guilherme Souza on 20/09/22.
//

import UIKit
import SwiftUI

class ConfirmViewController: UIViewController {
    
    let titleLabelContainer = UIView()
    let subtitleLabelContainer = UIView()
    let imageContainer = UIView()
    
    let upperStackView = UIStackView()
    let labelsStackView = UIStackView()
    let buttonsStackView = UIStackView()
    
    let labelsContainer = UIView()
    
    let fullStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    //MARK: - BOTÕES
    
    private lazy var confirmButton: UIButton = {
        
        let button = UIButton(type: .roundedRect)
        button.setTitle("Sim, prossiga", for: .normal)
        button.setTitleColor(UIColor(red: 53/255, green: 49/255, blue: 189/255, alpha: 1.0), for: .normal)
        button.backgroundColor = UIColor(red: 230/255, green: 242/255, blue: 255/255, alpha: 1.0)
        button.layer.frame = CGRect(x: 2.0, y: 0.0, width: 144, height: 48)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(confirmButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var refuseButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Não, cancela", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.frame = CGRect(x: 2.0, y: 0.0, width: 144, height: 48)
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(refuseButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - LABELS
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        let attrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .semibold)]
        let pieces = ["Upside Down Playlist"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: attrs)
        label.attributedText = attributedPieces
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .center
        let semiboldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular)]
        let pieces = ["Quer ver locais com base em ", "Upside Down playlist?"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        attributedPieces.append(NSMutableAttributedString(string: pieces[1], attributes: semiboldAttrs))
        label.attributedText = attributedPieces
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - IMAGENS
    
    private lazy var image: UIImageView = {
        let img = UIImage(named: "UPSIDE")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 220, height: 220)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit
        return imgV
        
    }()
    
    private lazy var imageOneBG: UIImageView = {
        let imageName = "ConfirmBG"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - HIERARQUIA
    
    func setupViewHierarchy() {
        view.addSubview(imageOneBG)
        view.addSubview(fullStackView)
        
        fullStackView.addArrangedSubview(upperStackView)
        fullStackView.addArrangedSubview(buttonsStackView)
        
        upperStackView.addArrangedSubview(imageContainer)
        upperStackView.addArrangedSubview(labelsContainer)
        
        labelsStackView.addArrangedSubview(titleLabelContainer)
        labelsStackView.addArrangedSubview(subtitleLabelContainer)
        
        buttonsStackView.addArrangedSubview(confirmButton)
        buttonsStackView.addArrangedSubview(refuseButton)
        
        imageContainer.addSubview(image)
        titleLabelContainer.addSubview(titleLabel)
        subtitleLabelContainer.addSubview(subtitleLabel)
        
        labelsContainer.addSubview(labelsStackView)
        
    }
    
    //MARK: - ATRIBUTOS
    
    func setupViewAttributes() {
        
        upperStackView.axis = .vertical
        upperStackView.alignment = .center
        upperStackView.distribution = .fill
        upperStackView.spacing = 8

        labelsStackView.axis = .vertical
        labelsStackView.alignment = .fill
        labelsStackView.distribution = .fill
        labelsStackView.spacing = 0

        imageContainer.contentMode = .scaleAspectFit

        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fill
        buttonsStackView.spacing = 8

        fullStackView.axis = .vertical
        fullStackView.alignment = .fill
        fullStackView.distribution = .fill
        fullStackView.spacing = 40/812*self.view.frame.height
        
    }
    
    //MARK: - LAYOUT
    
    func setupLayout() {
        
        upperStackView.translatesAutoresizingMaskIntoConstraints = false
        imageOneBG.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageOneBG.topAnchor.constraint(equalTo: view.topAnchor),
            imageOneBG.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageOneBG.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageOneBG.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: image.topAnchor),
            imageContainer.bottomAnchor.constraint(equalTo: image.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            image.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 52),
            image.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -52)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: titleLabelContainer.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -16)
        ])
        
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: subtitleLabelContainer.topAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: subtitleLabelContainer.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelContainer.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: subtitleLabelContainer.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            upperStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upperStackView.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -16)
        ])
        
        
        NSLayoutConstraint.activate([
            fullStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11.5),
            fullStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -11.5)
        ])
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: labelsContainer.topAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: labelsContainer.bottomAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: labelsContainer.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: fullStackView.leadingAnchor, constant: 116),
            buttonsStackView.trailingAnchor.constraint(equalTo: fullStackView.trailingAnchor, constant: -115),
            buttonsStackView.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            confirmButton.centerXAnchor.constraint(equalTo: buttonsStackView.centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: buttonsStackView.topAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: buttonsStackView.trailingAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor),
        ])
        
    }
    
    
    //MARK: - FUNÇÕES
    
    @objc func confirmButton(_ sender: UIButton) {
        let rootViewController = LoadingPageViewController()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.pushViewController(rootViewController, animated: true)
    }
    
    @objc func refuseButton(_ sender: UIButton) {
        let rootViewController = ChoiceViewController()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.pushViewController(rootViewController, animated: true)
    }
    
    

}
