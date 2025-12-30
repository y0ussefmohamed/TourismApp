//
//  Location.swift
//  TouristApp
//
//  Created by Youssef Mohamed on 22/12/2025.
//

import Foundation
import MapKit


struct Location: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String { name + cityName }
    
    // '==' Operator
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
