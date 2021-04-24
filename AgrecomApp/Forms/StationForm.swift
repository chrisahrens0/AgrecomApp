//
//  StationForm.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/16/21.
//

import SwiftUI

struct StationForm: View {
    @State private var correctiveRecommendation: String = ""
    @State private var selectedVegStatus = VegStatus.none
    @State private var BaitNotes: String = ""
    @State private var ReportNotes: String = ""
    
    var site: Site
    
    enum VegStatus: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        
        case none
        case low
        case medium
        case high
    }
    
    
    
    var body: some View {
        //NavigationView{
            Form{
                Section(header: Text("Facility Conditions")){
                    Picker(selection: $selectedVegStatus, label: Text("Vegetation Status"), content: {
                        Text("None").tag(VegStatus.none)
                        Text("Low").tag(VegStatus.low)
                        Text("Medium").tag(VegStatus.medium)
                        Text("High").tag(VegStatus.high)
                    })

                }
                Section(header: Text("Corrective Recommendation")){
                    TextEditor(text: $correctiveRecommendation)
                }
                    
                Section(header: Text("Pest Control Findings")){
                    // FIX to enable multiple selection
                    NavigationLink(destination: StationActivity()) {
                        Text("Select Stations with Activity")
                    }
                    NavigationLink(destination: StationActivity()){
                        Text("Select Inaccessible Stations")
                    }
                    
                    NavigationLink(destination: StationActivity()) {
                        Text("Select Damaged Stations")
                    }
                    
                    NavigationLink(destination: StationActivity()){
                        Text("Add New Staton QR Codes")
                    }
                    
                }
                
                Section(){
                    Picker(selection: .constant(1), label: Text("Bait Used")){
                        Text("Jaguar").tag(1)
                        Text("Liqua Tox").tag(2)
                        Text("Hawk").tag(3)
                        Text("Tempo SC Ultra").tag(4)
                        Text("Contrac").tag(5)
                        Text("Terad").tag(6)
                        Text("Final").tag(7)
                        Text("Other").tag(8)
                    }
                    TextField("Bait Notes", text: $BaitNotes)
                    
                }
                
                Section(header: Text("Addtional Notes Customers Plan of Action")){
                    TextEditor(text: $ReportNotes)
                }
            }
            .navigationTitle(Text("Edit Report"))
        //}
    }
}

struct StationActivity: View {
    var body: some View{
        Image("AgrecomLogo")
        MapView()
            .frame(height: 400)
        Text("Placeholder for Map and Station Selection List")
            .padding()
        Text("selects from list of sites, display site picture")
        
        Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Type of Activity")) {
            Text("Rodent").tag(1)
            Text("Insect").tag(2)
            Text("Reptile").tag(3)
            Text("Other").tag(4)
        }
    }
}

struct StationForm_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StationForm(site: ModelData().Sites[0])
            .environmentObject(modelData)
        
    }
}

//struct StationActivity_Previews: PreviewProvider {
//    static var previews: some View {
//        StationActivity()
//    }
//}
