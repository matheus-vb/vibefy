//
//  HomeViewController.swift
//  Vibefy
//
//  Created by matheusvb on 04/09/22.
//

import UIKit
import StoreKit

var artistsAttributes = [ArtistInfoAttributes]()
var albumsAttributes = [AlbumAttributes]()
var playlistAttributes = [PlaylistAttributes]()

class HomeViewController: UIViewController {
    
    let titleLabelContainer = UIView()
    let buttonContainer = UIView()
    
    let stackView = UIStackView()
    let dragView = DragView()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        let boldAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold)]
        let normalAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .light)]
        let pieces = ["Como está sua ", "vibe ", "hoje?"]
        let attributedPieces = NSMutableAttributedString(string: pieces[0], attributes: normalAttrs)
        attributedPieces.append(NSMutableAttributedString(string: pieces[1], attributes: boldAttrs))
        attributedPieces.append(NSMutableAttributedString(string: pieces[2], attributes: normalAttrs))
        label.attributedText = attributedPieces
        label.numberOfLines = 2
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private lazy var homeButton: UIButton = {
        let button = UIButton()
        let bgImage = UIImage(named: "ButtonHome")
        let bgImageView = UIImageView(image: bgImage)
        button.setBackgroundImage(UIImage(named: "ButtonHome"), for: .normal)
        button.layer.frame = CGRect(x: 0.0, y: 0.0, width: bgImageView.frame.width, height: bgImageView.frame.height)
        button.translatesAutoresizingMaskIntoConstraints = false
       // button.addTarget(self, action: #selector(chamaAPI), for: .touchUpInside)
        return button
    }()
    

    private lazy var homeBG: UIImageView = {
        let imageName = "BGhome.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var isDragging = false
    
    var fileViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupViewAttributes()
        dragViewSetup()
        let gestureRegocnizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture))
        gestureRegocnizer.cancelsTouchesInView = false
        dragView.addGestureRecognizer(gestureRegocnizer)
        setupLayout()
    }

    
    func setupViewHierarchy() {
        view.addSubview(homeBG)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabelContainer)
        stackView.addArrangedSubview(buttonContainer)
        
        titleLabelContainer.addSubview(titleLabel)
        buttonContainer.addSubview(homeButton)
        
    }
    
    func setupViewAttributes() {
        
        homeButton.addTarget(self, action: #selector(vibefyButton(_:)), for: .touchUpInside)

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 40
        
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            homeBG.topAnchor.constraint(equalTo: self.view.topAnchor),
            homeBG.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            homeBG.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            homeBG.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: titleLabelContainer.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: titleLabelContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: titleLabelContainer.trailingAnchor, constant: -32),
        ])
        
        NSLayoutConstraint.activate([
            self.homeButton.centerXAnchor.constraint(equalTo: self.buttonContainer.centerXAnchor),
            self.homeButton.centerYAnchor.constraint(equalTo: self.buttonContainer.centerYAnchor)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 134/812 * self.view.frame.height),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -285/812 * self.view.frame.height),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            self.dragView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.dragView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.dragView.heightAnchor.constraint(equalToConstant: 466),
            self.dragView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height - 130)
        ])
    }
    
    func dragViewSetup() {
        dragView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        dragView.center = view.center
        dragView.layer.cornerRadius = 40
        view.addSubview(dragView)
    }
    
    @objc func handlePanGesture(gesture:UIPanGestureRecognizer) {
        
        print(self.view.frame.height - 1029)
        print(self.view.frame.height - 706)
        print(self.view.frame.height - 950)

        if gesture.state == .began {
            print(dragView.center.y)
            print("Began")
        }else if gesture.state == .changed {
            let translation = gesture.translation(in: self.view)
            if((self.view.frame.height - dragView.center.y > 220 && translation.y < 0) || (self.view.frame.height - dragView.center.y < -103 && translation.y > 0)){
                print("Block")
            }else{
                gesture.view!.center = CGPoint(x: gesture.view!.center.x, y: gesture.view!.center.y + translation.y)
                gesture.setTranslation(CGPoint.zero, in: self.view)
            }
            if(self.view.frame.height - dragView.center.y > 220){
                dragView.center.y = self.view.frame.height - 220
            }
            if(self.view.frame.height - dragView.center.y < -103){
                dragView.center.y = self.view.frame.height + 103
            }
        }else if gesture.state == .ended {
            gesture.view?.center = CGPoint(x: self.dragView.center.x, y: self.dragView.center.y)
            print("ended")
            UIView.animate(withDuration: 0.15, animations: {
                if(self.view.frame.height -  self.dragView.center.y < -24){
                    self.dragView.center.y = self.view.frame.height + 103
                    print("Vai para a origem")
                }else{
                    self.dragView.center.y = self.view.frame.height - 220
                    print("Vai pra cima")
                }
            })
        }
    }
    
    @objc func vibefyButton(_ sender: UIButton) {
        let rootViewController = ChooseMethodViewController()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.pushViewController(rootViewController, animated: true)
    }
}
