//
//  Forecast.swift
//  WeatherApp
//
//  Created by Mark Booster on 08-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class Forecast {
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemperature: String!
    private var _lowTemperature: String!
    
    //HIERNAAR KIJKEN
    private var _forecasts = [Forecast]()
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var highTemperature: String {
        if _highTemperature == nil {
            _highTemperature = ""
        }
        
        return _highTemperature
    }
    
    var lowTemperature: String {
        if _lowTemperature == nil {
            _lowTemperature = ""
        }
        
        return _lowTemperature
    }
    
    //HIERNAAR KIJKEN!
    var forecasts: [Forecast] {
        _forecasts.remove(at: 0)
        return _forecasts
        
    }
    
    init() {
        
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let lowTemp = Double(min - CELSIUS_CONVERTER)
                self._lowTemperature = "\(lowTemp)"
                print("MARK: \(self._lowTemperature)")
            }
            
            if let max = temp["max"] as? Double {
                let highTemp = Double(max - CELSIUS_CONVERTER)
                self._highTemperature = "\(highTemp)"
                print("MARK: \(self._highTemperature)")

            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main.capitalized
                
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
            print("MARK: \(self._date)")
        }
    }
    
    func downloadForecast(downloadComplete: DownloadComplete) {
        let url = URL(string: FORECAST_URL)
        if url != nil {
            let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                
                if let responseData = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments)
                        
                        if let dict = json as? Dictionary<String, AnyObject> {
                            
                            if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                                for obj in list {
                                    let forecast = Forecast(weatherDict: obj)
                                    self._forecasts.append(forecast)
                                    
                                    
                                }
                                
                            }
                            
                        }
                    } catch {
                        print("MARK: Could not catch JSON for Forecast")
                    }
                }
                downloadComplete()
            })
            task.resume()
        }
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
