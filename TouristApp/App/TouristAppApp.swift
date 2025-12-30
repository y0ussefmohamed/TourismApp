//
//  TouristAppApp.swift
//  TouristApp
//
//  Created by Youssef Mohamed on 22/12/2025.
//

import SwiftUI

@main
struct TouristAppApp: App {
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
