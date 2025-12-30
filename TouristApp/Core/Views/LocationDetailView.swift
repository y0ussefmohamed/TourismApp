//
//  LocationDetailView.swift
//  TouristApp
//
//  Created by Youssef Mohamed on 23/12/2025.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: LocationViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { proxy in
                    TabView {
                        ForEach(location.imageNames, id: \.self) { name in
                            Image(name)
                                .resizable()
                                .frame(width: proxy.size.width, height: 400)
                                
                        }
                    }
                    .tabViewStyle(.page)
                }
                .frame(height: 400)
                .shadow(color: .black.opacity(0.3), radius: 20, y: 10)
            }
            
            VStack {
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(location.cityName)
                    
                    Divider()
                }.padding(.horizontal)
                
                
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(location.description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    if let url = URL(string: location.link) {
                        Link("Read more on Wikipedia", destination: url)
                            .font(.headline)
                            .tint(.blue)
                        
                    }
                }
                .padding([.horizontal, .top])
                
                Divider()
                    .padding(.horizontal)
                
                Map(initialPosition: .region(MKCoordinateRegion(
                    center: location.coordinates,
                    span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)
                ))) {
                    Annotation("Location", coordinate: location.coordinates) {
                        LocationMapAnotationView()
                            .shadow(radius: 10)
                    }
                }
                .allowsHitTesting(false)
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(30)
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundStyle(.foreground)
                            .padding(10)
                            .background(.thickMaterial)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .padding()
                }
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations[3])
        .environmentObject(LocationViewModel())
}
