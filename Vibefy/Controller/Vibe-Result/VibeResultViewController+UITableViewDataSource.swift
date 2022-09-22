//
//  VibeResultViewController+UITableViewDataSource.swift
//  Vibefy
//
//  Created by jpcm2 on 22/09/22.
//

import UIKit

extension VibeResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.id, for: indexPath) as? ResultsTableViewCell {
            return cell
        }
        fatalError("could not dequeue")
    }
}
