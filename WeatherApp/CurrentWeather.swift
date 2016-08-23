//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Mark Booster on 04-08-16.
//  Copyright © 2016 Mark Booster. All rights reserved.
//

import UIKit

class CurrentWeather {
    
    private var _date: String!
    private var _cityName: String!
    private var _weatherType: String!
    private var _currentTemperature: Double!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = currentDate
        
        return _date
        
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType
    }
    
    var currentTemperature: Double {
        if _currentTemperature == nil {
            _currentTemperature = 0.0
        }
        
        return _currentTemperature
    }
    
    func downloadCurrentWeather(downloadComplete: DownloadComplete) {
        let url = URL(string: CURRENT_WEATHER_URL)
        if url != nil {
            let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if let responeData = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: responeData, options: JSONSerialization.ReadingOptions.allowFragments)
                        
                        if let dict = json as? Dictionary<String, AnyObject> {
                            
                            if let name = dict["name"] as? String {
                                self._cityName = name
                                print("MARK: \(self._cityName)")
                            }
                            
                            if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                                if let main = weather[0]["main"] as? String {
                                    self._weatherType = main.capitalized
                                    print("MARK: \(self._weatherType)")
                                }
                            }
                            
                            if let main = dict["main"] as? Dictionary<String, AnyObject> {
                                if let temp = main["temp"] as? Double {
                                    let currentTemperature = Double(round(temp - CELSIUS_CONVERTER))
                                    self._currentTemperature = currentTemperature
                                    print("MARK: \(self._currentTemperature)")
                                    
                                }
                            }
                            
                            
                        }
                    } catch {
                        print("Could not catch JSON")
                        
                    }
                    
                }
                downloadComplete()
                
            })
            task.resume()
        }
    }
    
}


