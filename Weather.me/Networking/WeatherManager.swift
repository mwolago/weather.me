//
//  WeatherManager.swift
//  Weather.me
//
//  Created by Erni Iun on 2022/03/02.
//

import Foundation
import CoreLocation

//MARK: - protocols
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let mainURL = "https://api.openweathermap.org/data/2.5/weather?appid=YOUR_OPENWEATHERMAPAPI_KEY_HERE&units=metric"
    var delegate: WeatherManagerDelegate?

    func fetchWeather(cityName: String) {
        if cityName.contains(" ") {
            let city = cityName.replacingOccurrences(of: " ", with: "%20")
            let urlString = "\(mainURL)&q=\(city)"
            performRequest(with: urlString)
        } else {
            let urlString = "\(mainURL)&q=\(cityName)"
            performRequest(with: urlString)
        }
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(mainURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = parseJSON(safeData) {
                            delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

}
