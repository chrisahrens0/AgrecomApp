//
//  ModelData.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/15/21.
//

import Foundation
import SwiftUI
import Combine

final class ModelData: ObservableObject{
    @Published var Sites: [Site] = load("SiteList.json")
    
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
