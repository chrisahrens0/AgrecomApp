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
        NavigationView{
            Form{
                Section(header: Text("Report Info")){
                    Text("Report ID: 0001")
                    // use site json template for report json
                    Text("Site: " + site.siteName)
                    
                }
                Section(header: Text("Stations")){
                    NavigationLink(destination: StationForm()){
                        Text("Stations")
                    }
                }
            }
            .navigationTitle(Text("Edit Report"))
        }
    }
}

struct ReportForm_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ReportForm(site: ModelData().Sites[0])
            .environmentObject(modelData)
    }
}
