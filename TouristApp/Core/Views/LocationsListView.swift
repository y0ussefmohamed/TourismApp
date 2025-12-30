//
//  LocationsListView.swift
//  TouristApp
//
//  Created by Youssef Mohamed on 22/12/2025.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject var viewModel: LocationViewModel
    
    var body: some View {
        List(viewModel.locations) { location in
            Button {
                viewModel.showLocation(location)
            } label: {
                listRowView(for: location)
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }
        .frame(height: 400)
        .listStyle(.plain)
        .scrollIndicators(.visible)
    }
}

extension LocationsListView {
    private func listRowView(for location: Location) -> some View {
        HStack {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                
                Text(location.cityName)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationViewModel())
}
