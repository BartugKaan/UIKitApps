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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        //1. Create URL
        if let url = URL(string: urlString){
            //2. Create a URL Session
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    self.parseJSON(weatherData: safeData)
                }
            }
            //4. Start the Task
            task.resume()
        }
    }
    
    func parseJSON(weatherData : Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch{
            print(error)
        }
            
    }
}
