//
//  Models.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/24/21.
//

import Foundation
import SwiftUI


// Declare reports to be used throughout filing process
struct Report {
    var user: String = ""
    var pass: String = ""
    // Username and password used to login to postgres server.
    // Ensure that valid login accounts are stored in the server.
    // If sql returns 'invalid address: xxx.xxx.xxx.xxx', ensure that the sql server is accepting connections from that address.
    //      *Client may have to help you with this, we will have to delete the passwordless users and have client open up all addresses.
    
    var reportID = UUID()
    
    // Facility conditions
    var vegStat: String = ""
    var correctiveRecc: String = ""
    
    // Station info/Pest Control Findings
    var baits = [Int]()
    var stationsWithActivity = [Int]()
    var stationsInaccessible = [Int]()
    var stationsDamaged = [Int]()
    var stationCodesAdded = [(Int, UUID)]()
    // Tuple: first int = station number, second is UUID for QR code
    
    var additionalNotes: String = ""
    
    //Initializing with dummy values
    init() {
        user = ""
        pass = ""
        //reportID should initialize with UUID
        //reportID = UUID()
        vegStat = ""
        correctiveRecc = ""
        baits = [Int]()
        stationsWithActivity = [Int]()
        stationsInaccessible = [Int]()
        stationsDamaged = [Int]()
        stationCodesAdded = [(Int, UUID)]()
        additionalNotes = ""
    }
}
