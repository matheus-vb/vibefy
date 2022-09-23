//
//  VibeResultViewController+UITableViewDataSource.swift
//  Vibefy
//
//  Created by jpcm2 on 22/09/22.
//

import UIKit

extension VibeResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.id, for: indexPath) as? ResultsTableViewCell {
            print(result[indexPath.item].name)
            cell.titleLabel.text = result[indexPath.item].name
            cell.infoLabel.text = "\(result[indexPath.item].bairro)\n\(result[indexPath.item].type) - \(result[indexPath.item].price)"
            cell.iconImage.image = result[indexPath.item].maskImage
            return cell
        }
        fatalError("could not dequeue")
    }
}
