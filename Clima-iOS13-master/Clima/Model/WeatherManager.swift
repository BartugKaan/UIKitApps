//
//  WeatherManager.swift
//  Clima
//
//  Created by Bartuğ Kaan Çelebi on 16.05.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=564919da4c75145c7dcb7a7e29241ef7&units=metric"
    
    func fetchWeather(cityName : String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
