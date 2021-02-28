//
//  ContentView.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("AgrecomLogo")
            Text("Pest Control Tracker")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
            Text("Agrecom 2021")
                .font(.subheadline)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
