//
//  CircleImage.swift
//  Landmarks
//
//  Created by mesut alver on 29.11.2022.
//

import SwiftUI

// this is a common pattern when building views using SwiftUI
struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
        
            .overlay {
                
                Circle().stroke(.green, lineWidth: 4)
            }
        
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
