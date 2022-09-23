//
//  VibeResultController+UITableViewDelegate.swift
//  Vibefy
//
//  Created by jpcm2 on 22/09/22.
//

import UIKit

extension VibeResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootViewController = DetailsViewController()
        restauranteSelecionado = result[indexPath.item]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.pushViewController(rootViewController, animated: true)
    }
}
