# TourismApp 🌍

**TourismApp** is a modern iOS application designed to help users explore beautiful tourist locations with an immersive and interactive experience. Built with **SwiftUI** and following the **MVVM** architecture, this app showcases advanced map integration and fluid animations.

## 🚀 Features

### 📍 Interactive Map with MapKit

- **Dynamic Map**: Browsing locations updates the map region automatically.
- **Custom Annotations**: Locations are pinned on the map with custom headers.
- **Sync Animations**: The map seamlessly synchronizes with the location list. When you select a location, the map smoothly flies to the coordinate with a `easeInOut` animation calculation.

### 🔄 Synchronized Animations

The application relies heavily on synchronized state changes to provide a premium feel:

- **List to Map**: Tapping a location in the list instantly centers the map.
- **Map to Detail**: Selecting a location provides a detailed view with smooth transitions.
- **Declarative UX**: All animations are driven by SwiftUI's state management, ensuring bug-free UI updates.

## 🏗 Architecture

The app is built using the **MVVM (Model-View-ViewModel)** design pattern to ensure clean code, testability, and separation of concerns.

- **Model**: Simple data structures representing `Location` and coordinates.
- **View**: Pure SwiftUI views that observe the ViewModel.
  - `HomeView`: The main container.
  - `LocationPreviewView`: A floating card showing details of the selected annotation.
- **ViewModel**: `LocationViewModel` drives the business logic.
  - Manages the `mapRegion` state.
  - Handles logic for `nextLocation` and coordinate updates.
  - Uses `Combine` and `ObservableObject` to publish changes to the View.
- **Data Service**: `LocationsDataService` acts as the single source of truth for location data.

## 🛠 Tech Stack

- **Language**: Swift 5
- **UI Framework**: SwiftUI
- **Map Integration**: MapKit
- **State Management**: Combine, ObservableObject
- **Version Control**: Git & GitHub
