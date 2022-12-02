//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by mesut alver on 29.11.2022.
//

import SwiftUI

struct FavoriteButton: View {
    //  MARK: - Favori button oluşturma
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .red : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
        
    }
}
