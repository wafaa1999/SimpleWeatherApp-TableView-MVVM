//
//  WeatherViewModel.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 20/04/2022.
//

import Foundation
import UIKit

/// Weather View Model
class WeatherViewModel{
    
    /// Weather
    private var weather: WeatherDetails
    
    /// Request status
    private var requestStatus: RequestStatus?
    
    /// Representable
    private var representable: [CellRepresentable]
    
    /**
     Default init.
     */
    init() {
        self.weather = WeatherDetails()
        self.representable = []
    }
    
    /**
     Make representable.
     - Parameter weatherObject: as WeatherDetails..
     */
    func makeRepresentable(weatherObject: WeatherDetails) {
        self.representable.append(TextTableViewCellRepresentable(weatherDetails: .LocationNameCell(weatherObject.locationName ?? "")))
        self.representable.append(ImageTableViewCellRepresentable(imageURL: weatherObject.iconURL ?? ""))
        self.representable.append(TextTableViewCellRepresentable(weatherDetails: .StatusCell(weatherObject.weatherStatus ?? "")))
        self.representable.append(TextTableViewCellRepresentable(weatherDetails: .TemperatureCell(weatherObject.temperature ?? 0.0)))
    }
    
    /**
     Get number of rows in each section.
     - Parameter section: Section number as Int.
     - Returns: Number of rows in section as Int.
     */
    func numberOfRows(inSection section: Int) -> Int {
        return self.representable.count
    }
    
    /**
     Get height for each row in the table.
     - Parameter indexPath: Index path.
     - Parameter tableView: Table View.
     - Returns: height of cell as CGFloat.
     */
    func heightForRow(at indexPath: IndexPath, tableView: UITableView ) -> CGFloat {
        return representableForRow(at: indexPath)?.cellHeight ?? 0
    }
    
    /**
     Get cell representable at indexPath
     - Parameter indexPath: Index path.
     - Returns: Cell representable that conform CellRepresentable protocol.
     */
    func representableForRow(at indexPath: IndexPath) -> CellRepresentable? {
        return self.representable.count > indexPath.row ? self.representable[indexPath.row] : nil
    }
    
    /**
     Get requestStatus.
     - Returns: value of RequestStatus.
     */
    func getRequestStatus() -> RequestStatus {
        return requestStatus ?? .noStatus
    }
    
    /**
     Set requestStatus.
     - Parameter status: as RequestStatus.
     */
    func setRequestStatus(status: RequestStatus) {
        self.requestStatus = status
        
    }
}
