//
//  ReportForm.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/8/21.
//

import SwiftUI

struct ReportForm: View {
    @EnvironmentObject var modelData: ModelData
    var site: Site
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ReportForm_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ReportForm(site: ModelData().Sites[0])
            .environmentObject(modelData)
    }
}
