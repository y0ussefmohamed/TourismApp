//
//  LocationPreviewView.swift
//  TouristApp
//
//  Created by Youssef Mohamed on 23/12/2025.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var viewModel: LocationViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(spacing:0) {
                if let image = location.imageNames.first {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                        .padding(5)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.vertical, 10)
                    
                    
                    VStack(alignment: .leading, spacing: -5) {
                        Text(location.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            
                        Text(location.cityName)
                            
                    }
                }
            }
            
            Spacer()
            
            VStack {
                Button {
                    viewModel.sheetLocation = location
                } label: {
                    Text("Learn More")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 125, height: 35)
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    viewModel.showNextLocation()
                } label: {
                    Text("Next")
                        .foregroundStyle(.accent)
                        .font(.headline)
                        .frame(width: 125, height: 35)
                        .background(.clear)
                }
                .buttonStyle(.bordered)
            }
            
            
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(20)
        .padding(10)
    }
}

#Preview {
    ZStack {
        Color.green
            .edgesIgnoringSafeArea(.all)
        LocationPreviewView(location: LocationsDataService.locations.first!)
    }
    .environmentObject(LocationViewModel())
}
