//
//  Station.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/23/21.
//

import Foundation

struct Station: Hashable, Codable, Identifiable {
    var id: UUID
    var siteId: Int
    var stationID: Int
    
}
