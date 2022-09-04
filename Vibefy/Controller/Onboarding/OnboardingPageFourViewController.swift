//
//  HomeViewController.swift
//  Vibefy
//
//  Created by matheusvb on 04/09/22.
//

import UIKit

class OnboardingPageFourViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)
        
        view.addSubview(button)
        
        // Do any additional setup after loading the view.
    }
    
    @objc private func didTapStart(){
        let rootViewController = HomeViewController()
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.modalPresentationStyle = .fullScreen
        
        present(nav, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
