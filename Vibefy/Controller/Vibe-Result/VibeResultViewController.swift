//
//  VibeResultViewController.swift
//  Vibefy
//
//  Created by Bof on 20/09/22.
//

import UIKit

var result: [RestByMood] = []
var bgImage: String = ""
var vibeName: String = ""

class VibeResultViewController: UIViewController {
    let vibeContainer = UIView()
    let pretitleContainer = UIView()
    let resultsContainer = UIView()
    let locaisLabelContainer = UIView()
    
    let upperStackView = UIStackView()
    
    var resultsTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.showsHorizontalScrollIndicator = false
        
        tableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: ResultsTableViewCell.id)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var pretitleLabel: UILabel = {
        let label: UILabel = UILabel()
        let text = "sua vibe está"
        let textAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .light)]
        label.attributedText = NSMutableAttributedString(string: text, attributes: textAttr)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locaisLabel: UILabel = {
        let label: UILabel = UILabel()
        let text = "locais com sua vibe"
        let textAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .light)]
        label.attributedText = NSMutableAttributedString(string: text, attributes: textAttr)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var vibeLabel: UILabel = {
        let label: UILabel = UILabel()
        let text = "vibrante"
        let textAttr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40, weight: .regular)]
        label.attributedText = NSMutableAttributedString(string: text, attributes: textAttr)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var vibeBG: UIImageView = {
        let imageName = "Escolha.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image ?? UIImage())
        imageView.frame = CGRect(x: 0, y:0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let previousViewControllerIndex = (navigationController ?? UINavigationController()).viewControllers.count - 2
        navigationController?.viewControllers.remove(at: previousViewControllerIndex)
        
        setupTableView()
        setupHierarchy()
        setupAttributes()
        setupLayouts()
    }
    
    func setupTableView() {
        resultsTableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: ResultsTableViewCell.id)
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
    }
    
    func setupHierarchy() {
        view.addSubview(vibeBG)
        view.addSubview(upperStackView)

        view.addSubview(upperStackView)
        view.addSubview(locaisLabelContainer)
        view.addSubview(resultsContainer)
                
        upperStackView.addArrangedSubview(pretitleContainer)
        upperStackView.addArrangedSubview(vibeContainer)
        
        resultsContainer.addSubview(resultsTableView)
        locaisLabelContainer.addSubview(locaisLabel)
        pretitleContainer.addSubview(pretitleLabel)
        vibeContainer.addSubview(vibeLabel)
    }
    
    func setupAttributes() {
        
        upperStackView.axis = .vertical
        upperStackView.alignment = .fill
        upperStackView.distribution = .fill
        upperStackView.spacing = 24
        
        vibeBG.image = UIImage(named: bgImage)
        vibeLabel.text = vibeName
        
    }
    
    func setupLayouts() {
        vibeContainer.translatesAutoresizingMaskIntoConstraints = false
        pretitleContainer.translatesAutoresizingMaskIntoConstraints = false
        locaisLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        upperStackView.translatesAutoresizingMaskIntoConstraints = false
        resultsContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vibeBG.topAnchor.constraint(equalTo: view.topAnchor),
            vibeBG.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            vibeBG.leftAnchor.constraint(equalTo: view.leftAnchor),
            vibeBG.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            upperStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: (122/812)*self.view.frame.height),
            upperStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upperStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                                        
                                                        upperStackView.bottomAnchor.constraint(equalTo: upperStackView.topAnchor, constant: 98)
        ])
        
        NSLayoutConstraint.activate([
            resultsContainer.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: +120),
            resultsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pretitleContainer.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            locaisLabelContainer.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: 60),
            locaisLabelContainer.heightAnchor.constraint(equalToConstant: 38),
            locaisLabelContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locaisLabelContainer.widthAnchor.constraint(equalToConstant: self.view.frame.width)
        ])
        
        NSLayoutConstraint.activate([
            locaisLabel.leadingAnchor.constraint(equalTo: locaisLabelContainer.leadingAnchor, constant: 60),
            locaisLabel.trailingAnchor.constraint(equalTo: locaisLabelContainer.trailingAnchor, constant: -70),
            locaisLabel.topAnchor.constraint(equalTo: locaisLabelContainer.topAnchor),
            locaisLabel.bottomAnchor.constraint(equalTo: locaisLabelContainer.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pretitleLabel.centerXAnchor.constraint(equalTo: pretitleContainer.centerXAnchor),
            pretitleLabel.bottomAnchor.constraint(equalTo: pretitleContainer.bottomAnchor),
            pretitleLabel.topAnchor.constraint(equalTo: pretitleContainer.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            vibeLabel.centerXAnchor.constraint(equalTo: vibeContainer.centerXAnchor),
            vibeLabel.bottomAnchor.constraint(equalTo: vibeContainer.bottomAnchor),
            vibeLabel.topAnchor.constraint(equalTo: vibeContainer.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            resultsTableView.topAnchor.constraint(equalTo: resultsContainer.topAnchor),
            resultsTableView.leadingAnchor.constraint(equalTo: resultsContainer.leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: resultsContainer.trailingAnchor),
            resultsTableView.bottomAnchor.constraint(equalTo: resultsContainer.bottomAnchor)

        ])
        
    }
    
}
