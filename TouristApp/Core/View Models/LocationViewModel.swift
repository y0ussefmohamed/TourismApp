//
//  LocationViewModel.swift
//  TouristApp
//
//  Created by Youssef Mohamed on 22/12/2025.
//

import Foundation
import Combine
import MapKit
import SwiftUI


class LocationViewModel: ObservableObject {
    @Published var sheetLocation: Location? = nil
    @Published var showLocationsList: Bool = false
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            centerMapOnNewRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        
        self.locations = locations
        
        self.mapLocation = locations.first!
        
        self.centerMapOnNewRegion(location: locations.first!)
    }
    
    private func centerMapOnNewRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    
    public func toggleShowLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    public func showLocation(_ location: Location) {
        withAnimation(.easeInOut) {
            self.mapLocation = location
            showLocationsList = false
        }
    }
    
    public func showNextLocation() {
        guard let currentIndex = locations.firstIndex(of: mapLocation) else {
            print("Error: Current location not found in array")
            return
        }
        
        currentIndex+1 < locations.count ? showLocation(locations[currentIndex+1]) : showLocation(locations[0])
    }
}

