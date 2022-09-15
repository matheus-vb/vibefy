//
//  OnboardingPageOneViewController.swift
//  Vibefy
//
//  Created by matheusvb on 03/09/22.
//

import UIKit
import CoreLocation

class OnboardingPageThreeViewController: UIViewController {
    
    let titleLabelContainer = UIView()
    let subtitleLabelContainer = UIView()
    let imageOneContainer = UIView()
    
    let labelsStackView = UIStackView()
    let upperStackView = UIStackView()
    let buttonsStackView = UIStackView()
    
    let labelsContainer = UIView()
    
    let fullStackView = UIStackView()
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
        locationManager.delegate = self
        
    }
    
    
    // MARK: -BOTÕES
    
    
    let allowButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Compartilhe sua localização", for: .normal)
        button.setTitleColor(UIColor(red: 53/255, green: 49/255, blue: 189/255, alpha: 1.0), for: .normal)
        button.backgroundColor = UIColor(red: 230/255, green: 242/255, blue: 255/255, alpha: 1.0)
        button.layer.frame = CGRect(x: 2.0, y: 0.0, width: 298, height: 52)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(getLocation), for: .touchUpInside)
        
        return button
    }()
    
    let dontAllowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Não compartilhar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.frame = CGRect(x: 2.0, y: 0.0, width: 52, height: 32)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 14
        button.layer.borderColor = UIColor(red: 238/255,green: 238/255, blue: 238/55, alpha: 1.0).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didNotAllow), for: .touchUpInside)
        
        
        return button
    }()
    
    // MARK: -LABELS
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .light)]
        let pieces = ["Sugerimos locais para ", "comer ", "e ", "beber"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        attributedPieces.append(NSMutableAttributedString(string: pieces[1], attributes: boldAttrs))
        attributedPieces.append(NSMutableAttributedString(string: pieces[2], attributes: normalAttrs))
        attributedPieces.append(NSMutableAttributedString(string: pieces[3], attributes: boldAttrs))
        label.attributedText = attributedPieces
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Sempre com sua Vibe musical."
        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
        label.numberOfLines = 3
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageOne: UIImageView = {
        let img = UIImage(named: "onBoarding3")
        let imgV = UIImageView(image: img)
        imgV.frame = CGRect(x: 0 , y: 0, width: 300, height: 300)
        imgV.translatesAutoresizingMaskIntoConstraints = false
        imgV.contentMode = .scaleAspectFit
        return imgV
    }()
    
    private lazy var imageOneBG: UIImageView = {
        let imageName = "BGOnboarding3.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    //MARK: - HIERARQUIA VIEWS
    
    
    func setupViewHierarchy() {
        view.addSubview(imageOneBG)
        view.addSubview(fullStackView)
        
        fullStackView.addArrangedSubview(upperStackView)
        fullStackView.addArrangedSubview(buttonsStackView)
        
        upperStackView.addArrangedSubview(labelsContainer)
        upperStackView.addArrangedSubview(imageOneContainer)
        
        labelsStackView.addArrangedSubview(titleLabelContainer)
        labelsStackView.addArrangedSubview(subtitleLabelContainer)
        
        buttonsStackView.addArrangedSubview(allowButton)
        buttonsStackView.addArrangedSubview(dontAllowButton)
        
        imageOneContainer.addSubview(imageOne)
        titleLabelContainer.addSubview(titleLabel)
        subtitleLabelContainer.addSubview(subtitleLabel)
        
        labelsContainer.addSubview(labelsStackView)
        
        
    }
    
    //MARK: - ATRIBUTOS STACKS
    
    func setupViewAttributes() {
        
        upperStackView.axis = .vertical
        upperStackView.alignment = .fill
        upperStackView.distribution = .fill
        upperStackView.spacing = 8
        
        labelsStackView.axis = .vertical
        labelsStackView.alignment = .fill
        labelsStackView.distribution = .fill
        labelsStackView.spacing = 0
        
        imageOneContainer.contentMode = .scaleAspectFit
        
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
        
        NSLayoutConstraint.activate([
            imageOneBG.topAnchor.constraint(equalTo: view.topAnchor),
            imageOneBG.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageOneBG.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageOneBG.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: titleLabelContainer.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -16)])
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: subtitleLabelContainer.topAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: subtitleLabelContainer.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: subtitleLabelContainer.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: subtitleLabelContainer.trailingAnchor, constant: -16)])
        
        imageOneContainer.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageOne.topAnchor.constraint(equalTo: imageOneContainer.topAnchor),
            imageOne.bottomAnchor.constraint(equalTo: imageOneContainer.bottomAnchor),
            imageOne.leadingAnchor.constraint(equalTo: imageOneContainer.leadingAnchor, constant: 52),
            imageOne.trailingAnchor.constraint(equalTo: imageOneContainer.trailingAnchor, constant: -52)
        ])
        
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upperStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            fullStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11.5),
            fullStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -11.5)])
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: labelsContainer.topAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: labelsContainer.bottomAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: labelsContainer.trailingAnchor)
        ])
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: fullStackView.leadingAnchor, constant: 27),
            buttonsStackView.trailingAnchor.constraint(equalTo: fullStackView.trailingAnchor, constant: -27),
            buttonsStackView.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: -(32/926)*self.view.frame.height)
            
        ])
        
        NSLayoutConstraint.activate([
            allowButton.centerXAnchor.constraint(equalTo: buttonsStackView.centerXAnchor),
            allowButton.topAnchor.constraint(equalTo: buttonsStackView.topAnchor),
            allowButton.trailingAnchor.constraint(equalTo: buttonsStackView.trailingAnchor),
            allowButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor),
            allowButton.heightAnchor.constraint(equalToConstant: 52),
            dontAllowButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        allowButton.addTarget(self.parent, action: #selector(OnboardingViewController.skipTapped(_:)), for: .primaryActionTriggered)
        
    }
    
    //MARK: -ação de botões
    @objc private func didNotAllow(){
        let rootViewController = HomeViewController()
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: true)
    }
    
    @objc private func getLocation() {
        self.locationManager.requestWhenInUseAuthorization()
        let rootViewController = HomeViewController()
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: true)
    }
}

extension OnboardingPageThreeViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied:
            print("Denied")
        case .notDetermined:
            print("not determined")
            locationManager.requestLocation()
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.requestLocation()
        case .authorizedAlways:
            print("authorizedAlways")
            locationManager.requestLocation()
        case .restricted:
            print("LocationManager didChangeAuthorization restricted")
        default:
            print("LocationManager didChangeAuthorization")
        }
    
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LocationManager didFailWithError \(error.localizedDescription)")
        if let error = error as? CLError, error.code == .denied {
           locationManager.stopMonitoringSignificantLocationChanges()
           return
        }
      }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocation")
        }

}
