//
//  FormPage.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/8/21.
//

import SwiftUI

struct FormPage: View {
    @EnvironmentObject var modelData:ModelData
    var site: Site
    //var siteID: Int
    
    @State var username: String = ""
    @State var password: String = ""
    
    
    @State var isLinkActive = false
    
    var body: some View {
        //NavigationView{
            Form {
                Section(header: Text("User Profile")){
                    TextField("Username", text: $username)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $password)
                }
                Section(header: Text("Timestamp")){
                    let date = Date()
                    let calendar = Calendar.current
                    let hour = calendar.component(.hour, from: date)
                    let minute = calendar.component(.minute, from: date)
                    let year = calendar.component(.year, from: date)
                    let month = calendar.component(.month, from:date)
                    let day = calendar.component(.day, from: date)
                    //VStack {
                        Text(verbatim: "\(year)/\(month)/\(day)")
                        Text("\(String(format: "%02d", hour)):\(String(format: "%02d", minute))")
                    //}
                }
                Section(header: Text("Site Information")){
                    Text(site.siteName)
                    Text("Report ID: " + "000001")
                }
                NavigationLink(destination: StationForm(site: ModelData().Sites[0]), isActive: $isLinkActive){
                    Button(action: {
                        self.isLinkActive = true
                    }) {
                        Text("Start Report")
                    }
                }
            }
            //.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal){
                    VStack {
                        Text(site.siteName).font(.headline)
                        Text("New Report").font(.subheadline)
                    }
                }
            }
            
        //}
    }
}

struct FormPage_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        FormPage(site: ModelData().Sites[0])
            .environmentObject(modelData)
    }
}
