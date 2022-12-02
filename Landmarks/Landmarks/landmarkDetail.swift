//
//  landmarkDetail.swift
//  Landmarks
//
//  Created by mesut alver on 29.11.2022.
//

import SwiftUI

struct landmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where:  { $0.id == landmark.id  })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: Image("turtlerock"))
                .offset(y: -130)
                .padding(.bottom, -130)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Turtle Rock")
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                
                HStack {
                    Text("Josua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                
                Divider()
                
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
                
            }
            .padding()
            
           
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct landmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    
    static var previews: some View {
        landmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
