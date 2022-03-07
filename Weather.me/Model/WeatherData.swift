//
//  WeatherData.swift
//  Weather.me
//
//  Created by Erni Iun on 2022/03/03.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
