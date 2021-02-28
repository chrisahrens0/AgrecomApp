//
//  Site.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/15/21.
//

import Foundation
import SwiftUI

struct Site: Hashable, Codable, Identifiable {
    var id: Int
    var siteName: String
    var description: String
    var category: String
    var addressLine1: String
    var addressLine2: String
    
    
}

