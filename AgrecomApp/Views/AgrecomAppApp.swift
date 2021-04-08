//
//  AgrecomAppApp.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/15/21.
//

import SwiftUI

@main
struct AgrecomAppApp: App {
    @StateObject private var modelData = ModelData()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
