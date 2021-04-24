//
//  Station.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/23/21.
//

import Foundation
import SwiftUI

struct Station: Hashable, Codable, Identifiable {
    var id = UUID()
    var siteID: Int
    var stationID: Int
    
}

extension Station {
    static func dummyData() -> [Station] {
        var array = [Station]()
        
        for i in 0...30{
            let stat = Station(siteID: 10001, stationID: (10000+i))
            array.append(stat)
        }
        
        return array;
    }
}
