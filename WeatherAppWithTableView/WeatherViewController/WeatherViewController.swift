//
//  ViewController.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 19/04/2022.
//

import UIKit

/// Weather View Controller.
class WeatherViewController: UIViewController {
    
    /// Weather model view.
    private(set) var weatherModelView: WeatherViewModel!
    
    /// Weather table view.
    @IBOutlet weak var weatherTableView: UITableView!
    
    /**
     View did load.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.weatherModelView = WeatherViewModel()
        self.fetchData(key: "f9fb0ed95ba94fc3abf63021221004", location: "Russia", aqi: "no")
    }
    
    /**
     Fetch data from API.
     - Parameter key: as String.
     - Parameter location: as String.
     - Parameter aqi: as String.
     */
    private func fetchData(key: String, location: String, aqi: String) {
        self.weatherModelView.setRequestStatus(status: .loading)
        WeatherModel.getWeather(key: key, location: location, aqi: aqi) { result in
            switch result {
            case .success(let weatherResult):
                self.weatherModelView.makeRepresentable(weatherObject: weatherResult)
                self.weatherModelView.setRequestStatus(status: .success)
                self.weatherTableView.reloadData()
            case .failure(let error):
                self.weatherModelView.setRequestStatus(status: .failure)
                print(error)
            }
        }
    }
    
    /**
     Setup table view
     */
    private func setupTableView() {
        self.weatherTableView.delegate = self
        self.weatherTableView.dataSource = self
        self.weatherTableView.backgroundColor = .darkGray
    }
}

