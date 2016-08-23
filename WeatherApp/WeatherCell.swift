//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Mark Booster on 04-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(forecast: Forecast) {
        dayLabel.text = forecast.date
        weatherTypeLabel.text = forecast.weatherType
        maxTemperature.text = forecast.highTemperature
        minTemperature.text = forecast.lowTemperature
        weatherImage.image = UIImage(named: forecast.weatherType)
    }

}
