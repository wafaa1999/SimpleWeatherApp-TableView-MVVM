//
//  WestherViewController+UITableView.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 20/04/2022.
//

import Foundation
import UIKit

// Mark: - UITableViewDelegate & UITableViewDataSource

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherModelView.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard self.weatherModelView.representableForRow(at: indexPath) != nil else { return UITableViewCell() }
        if let representable = self.weatherModelView.representableForRow(at: indexPath) as? ImageTableViewCellRepresentable {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.getReuseIdentifier()) as? ImageTableViewCell
            cell?.setup(representable: representable)
            return cell ?? UITableViewCell()
        }
        if let representable = self.weatherModelView.representableForRow(at: indexPath) as? TextTableViewCellRepresentable {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.getReuseIdentifier()) as? TextTableViewCell
            cell?.setup(representable: representable )
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.weatherModelView.heightForRow(at: indexPath, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
