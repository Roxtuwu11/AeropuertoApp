//
//  APIViewModel.swift
//  AeropuertoApp
//
//  Created by MAC on 21/09/22.
//

import Foundation
import SwiftUI
@MainActor
final class APIViewModel: ObservableObject {
    @Published var airports: [Airport] = []
    @Published var radius: Float = 0

    func getAirports(latitude: Double, longitude: Double)  {
        let headers = [
            "X-RapidAPI-Key": "63f467216cmsh60e3810e79b512fp169c0ejsnc286fb980fb7",
            "X-RapidAPI-Host": "aviation-reference-data.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://aviation-reference-data.p.rapidapi.com/airports/search?lat=\(String(latitude))&lon=\(String(longitude))&radius=\(String(format: "%.0f",radius))")! as
                                          URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask =  session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            print("Este es el error \(String(describing: error))")
            print("Este es el response \(String(describing: response))")
            print("Este es el data \(String(describing: data))")
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                print("usamose data")
            
            if let data = data,
             let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let airportData = try! JSONDecoder().decode([Airport].self, from: data)
                self.airports = airportData
            }
        }
        }).resume()
    }
    var getAllAirports: [Airport] {
        return airports
    }
}
