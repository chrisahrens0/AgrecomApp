//
//  FavoriteButton.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/8/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }){
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.blue : Color.gray)
        }
    }
}

struct BigBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0.5, blue: 0.9))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
