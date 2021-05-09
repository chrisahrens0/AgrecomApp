//
//  ContentView.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SiteListPage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
            .environmentObject(ModelData())
    }
}
