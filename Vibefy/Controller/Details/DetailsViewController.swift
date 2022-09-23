//
//  DetailsViewController.swift
//  Vibefy
//
//  Created by matheusvb on 19/09/22.
//

import UIKit
import CoreData

var restauranteSelecionado: RestByMood = RestByMood(name: "", type: "", price: "", rating: "", address: "", bairro: "", maskImage: UIImage(), backImage: nil, filters: [""], drinks: true)

class DetailsViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //let rest: RestByMood = RestByMood()
    
    let labelStack = UIStackView()
    let wideStack = UIStackView()
    let topFullStack = UIStackView()
    
    let imagesLabelContainer = UIView()
    let filtrosLabelContainer = UIView()
    let titleLabelContainer = UIView()
    let subLabelContainer = UIView()
    let endLabelContainer = UIView()
    let ratingLabelContainer = UIView()
    let logoImageContainer = UIView()
    let favButtonContainer = UIView()
    
    private lazy var detailsBG: UIImageView = {
        let imageName = "BGdetails.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImage(named: "bacurau")
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var mapImg: UIImageView = {
        let image = UIImage(named: "place")
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var favButton: UIButton = {
        let button = UIButton()
        let bgImage = UIImage(named: "favorite")
        let bgImageView = UIImageView(image: bgImage)
        button.setBackgroundImage(UIImage(named: "favorite"), for: .normal)
        button.layer.frame = CGRect(x: 0.0, y: 0.0, width: 50, height: 50)
        button.contentMode = .top
        button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTouch), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Casa Bacurau"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Bar  •  $$$"
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var endLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Várzea, Rua Medeiros 1432"
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "3.8"
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var filtrosCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.itemSize = CGSize(width: 89, height: 32)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 335, height: 32), collectionViewLayout: viewLayout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FiltrosCollectionViewCell.self, forCellWithReuseIdentifier: FiltrosCollectionViewCell.id)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var imagesCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.itemSize = CGSize(width: 180, height: 112)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 335, height: 32), collectionViewLayout: viewLayout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ImagesCollectionViewCell.self, forCellWithReuseIdentifier: ImagesCollectionViewCell.id)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var filtrosLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Filtros"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var imagesLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Imagens do local"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupAttributes()
        setupLayout()
        
        filtrosCollection.delegate = self
        filtrosCollection.dataSource = self
        
        imagesCollection.delegate = self
        imagesCollection.dataSource = self
    }
    
    func setupHierarchy() {
        view.addSubview(detailsBG)
        view.addSubview(scrollView)
                
        logoImageContainer.addSubview(logoImage)
        favButtonContainer.addSubview(favButton)
        titleLabelContainer.addSubview(titleLabel)
        subLabelContainer.addSubview(subLabel)
        endLabelContainer.addSubview(endLabel)
        ratingLabelContainer.addSubview(ratingLabel)
        filtrosLabelContainer.addSubview(filtrosLabel)
        imagesLabelContainer.addSubview(imagesLabel)
        
        labelStack.addArrangedSubview(titleLabelContainer)
        labelStack.addArrangedSubview(subLabelContainer)
        labelStack.addArrangedSubview(endLabelContainer)
        labelStack.addArrangedSubview(ratingLabelContainer)
        
        wideStack.addArrangedSubview(labelStack)
        wideStack.addArrangedSubview(favButtonContainer)
        
        topFullStack.addArrangedSubview(logoImageContainer)
        topFullStack.addArrangedSubview(wideStack)
        
        scrollView.addSubview(topFullStack)
        scrollView.addSubview(filtrosLabelContainer)
        scrollView.addSubview(filtrosCollection)
        scrollView.addSubview(imagesLabelContainer)
        scrollView.addSubview(imagesCollection)
    }

    func setupAttributes() {
        topFullStack.alignment = .fill
        topFullStack.distribution = .fill
        topFullStack.axis = .vertical
        topFullStack.spacing = 16
        
        labelStack.alignment = .fill
        labelStack.distribution = .fill
        labelStack.axis = .vertical
        labelStack.spacing = 8
        
        wideStack.alignment = .fill
        wideStack.distribution = .fill
        wideStack.axis = .horizontal
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 740)
        
        filtrosLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        imagesLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        favButton.translatesAutoresizingMaskIntoConstraints = false
        filtrosCollection.translatesAutoresizingMaskIntoConstraints = false
        
        detailsBG.image = UIImage(named: bgImage)
        logoImage.image = restauranteSelecionado.maskImage
        self.titleLabel.text = restauranteSelecionado.name
        self.subLabel.text = "\(restauranteSelecionado.type)  •  \(restauranteSelecionado.price)"
        self.endLabel.text = restauranteSelecionado.address
        //self.ratingLabel.text = restauranteSelecionado.rating
    }
    
    func setupLayout() {
        
        topFullStack.frame = CGRect(x: 0, y: 16, width: self.view.frame.width, height: 301)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            detailsBG.topAnchor.constraint(equalTo: view.topAnchor),
            detailsBG.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailsBG.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailsBG.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: logoImageContainer.topAnchor),
            logoImage.bottomAnchor.constraint(equalTo: logoImageContainer.bottomAnchor),
            logoImage.leftAnchor.constraint(equalTo: logoImageContainer.leftAnchor),
            logoImage.rightAnchor.constraint(equalTo: logoImageContainer.rightAnchor),
            logoImageContainer.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleLabelContainer.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleLabelContainer.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: titleLabelContainer.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: titleLabelContainer.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalTo: subLabelContainer.topAnchor),
            subLabel.bottomAnchor.constraint(equalTo: subLabelContainer.bottomAnchor),
            subLabel.leftAnchor.constraint(equalTo: subLabelContainer.leftAnchor, constant: 20),
            subLabel.rightAnchor.constraint(equalTo: subLabelContainer.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            endLabel.topAnchor.constraint(equalTo: endLabelContainer.topAnchor),
            endLabel.bottomAnchor.constraint(equalTo: endLabelContainer.bottomAnchor),
            endLabel.leftAnchor.constraint(equalTo: endLabelContainer.leftAnchor, constant: 20),
            endLabel.rightAnchor.constraint(equalTo: endLabelContainer.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: ratingLabelContainer.topAnchor),
            ratingLabel.bottomAnchor.constraint(equalTo: ratingLabelContainer.bottomAnchor),
            ratingLabel.leftAnchor.constraint(equalTo: ratingLabelContainer.leftAnchor, constant: 20),
            ratingLabel.rightAnchor.constraint(equalTo: ratingLabelContainer.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            favButton.topAnchor.constraint(equalTo: favButtonContainer.topAnchor, constant: 20),
            favButton.centerXAnchor.constraint(equalTo: favButtonContainer.centerXAnchor),
            favButtonContainer.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            filtrosLabelContainer.topAnchor.constraint(equalTo: topFullStack.bottomAnchor, constant: 44.5),
            filtrosLabelContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            filtrosLabelContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            filtrosLabelContainer.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            filtrosLabel.topAnchor.constraint(equalTo: filtrosLabelContainer.topAnchor),
            filtrosLabel.leadingAnchor.constraint(equalTo: filtrosLabelContainer.leadingAnchor),
            filtrosLabel.trailingAnchor.constraint(equalTo: filtrosLabelContainer.trailingAnchor, constant: -250),
            filtrosLabel.bottomAnchor.constraint(equalTo: filtrosLabelContainer.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            filtrosCollection.topAnchor.constraint(equalTo: filtrosLabelContainer.bottomAnchor),
            filtrosCollection.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            filtrosCollection.widthAnchor.constraint(equalToConstant: 335),
            filtrosCollection.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            imagesLabelContainer.topAnchor.constraint(equalTo: filtrosCollection.bottomAnchor, constant: 20),
            imagesLabelContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imagesLabelContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            imagesLabelContainer.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            imagesLabelContainer.topAnchor.constraint(equalTo: filtrosCollection.bottomAnchor, constant: 20),
            imagesLabelContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imagesLabelContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            imagesLabelContainer.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            imagesCollection.topAnchor.constraint(equalTo: imagesLabelContainer.bottomAnchor),
            imagesCollection.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            imagesCollection.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            imagesCollection.heightAnchor.constraint(equalToConstant: 112)
        ])
    }
    

    @objc func didTouch(){
        print("cocococococo")
    }


//    func createItem(rest: RestByMood) {
//        let new = RestsItem(context: context)
//
//        new.name = rest.name
//        new.type = rest.type
//        new.address = rest.address
//        new.mood = rest.mood
//        new.backImage = rest.backImage
//        new.maskImage = rest.maskImage
//        new.drinks = rest.drinks
//        new.filter = rest.filters[0]
//        new.price = rest.price
//        new.rating = rest.rating
//
//        do {
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//
//    func removeItem(item: RestsItem) {
//        context.delete(item)
//
//        do {
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//
}
