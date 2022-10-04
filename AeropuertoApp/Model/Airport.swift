//
//  AirportModel.swift
//  AeropuertoApp
//
//  Created by MAC on 23/09/22.
//

import Foundation

struct Airport: Decodable {
    var iataCode: String
    var latitude: Double
    var longitude: Double
    var name: String
}

extension Airport: Identifiable {
    var id: String {iataCode}
}
/*struct AirportsResponseDataModel: Decodable {
    let airports: [Airports]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.airports = try container.decode([Airports].self, forKey: .results)
    }
} */



