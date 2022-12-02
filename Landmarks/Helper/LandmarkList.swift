//
//  LandmarkList.swift
//  Landmarks
//
//  Created by mesut alver on 29.11.2022.
//

import SwiftUI

struct LandmarkList: View {
    
    // MARK: Favori listesi ve modeli aktarmm
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (showFavoritesOnly || landmark.isFavorite)
        }
        
    }
    
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        landmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation", "iPhone 14 Pro Max"], id: \.self) {
            deviceName in
            LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName ))
                .previewDisplayName(deviceName)
        }
    }
}
