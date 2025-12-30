//
//  LocationView.swift
//  TouristApp
//
//  Created by Youssef Mohamed on 22/12/2025.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @EnvironmentObject private var viewModel: LocationViewModel
    
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack {
                header
                    .padding()
                
                Spacer()
                
                ZStack {
                    locationPreview
                }
            }
        }
        .sheet(item: $viewModel.sheetLocation,onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

extension HomeView {
    private var mapLayer: some View {
        Map(coordinateRegion: $viewModel.mapRegion,
            annotationItems: viewModel.locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnotationView()
                        .scaleEffect(viewModel.mapLocation == location ? 1.2 : 0.8)
                        .shadow(radius: 10)
                        .onTapGesture {
                            viewModel.showLocation(location)
                        }
                }
            })
    }
    
    private var header: some View {
        VStack {
            Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                .font(.title)
                .bold()
                .foregroundStyle(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: viewModel.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.right")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .padding()
                        .onTapGesture {
                            viewModel.toggleShowLocationsList()
                        }
                        .rotationEffect(Angle(degrees:
                                                viewModel.showLocationsList ? 90 : 0))
                }
            
            if(viewModel.showLocationsList) { LocationsListView() }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var locationPreview: some View {
        LocationPreviewView(location: viewModel.mapLocation)
            .padding(5)
            .shadow(radius: 10)
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
}


#Preview {
    HomeView()
        .environmentObject(LocationViewModel())
}
