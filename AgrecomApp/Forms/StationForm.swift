//
//  StationForm.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/16/21.
//

import SwiftUI

struct StationForm: View {
    @State private var correctiveRecommendation: String = ""
    @State private var BaitNotes: String = ""
    @State private var ReportNotes: String = ""
    //@Binding var report: Report
    
    var site: Site
    
    enum VegStatus: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        
        case none
        case low
        case medium
        case high
    }
    @State private var selectedVegStatus = VegStatus.none
    
    enum BaitSelected: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        
        case none
        case jaguar
        case liquatox
        case hawk
        case tempo
        case contrac
        case terad
        case final
        case other
    }
    @State private var selectedBait = BaitSelected.none
    
    
    
    var body: some View {
        //NavigationView{
            Form{
                Section(header: Text("Report Information")){
                    Text("Report ID: " + "000001")
                    Text("User: " + "Test_user")
                }
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
                        Text("Add New Station QR Codes")
                    }
                    
                }
                
                Section(){
                    Picker(selection: $selectedBait, label: Text("Bait Used")){
                        Text("None").tag(BaitSelected.none)
                        Text("Jaguar").tag(BaitSelected.jaguar)
                        Text("Liqua Tox").tag(BaitSelected.liquatox)
                        Text("Hawk").tag(BaitSelected.hawk)
                        Text("Tempo SC Ultra").tag(BaitSelected.tempo)
                        Text("Contrac").tag(BaitSelected.contrac)
                        Text("Terad").tag(BaitSelected.terad)
                        Text("Final").tag(BaitSelected.final)
                        Text("Other").tag(BaitSelected.other)
                    }
                    TextField("Bait Notes", text: $BaitNotes)
                    
                }
                
                Section(header: Text("Addtional Notes/Customers Plan of Action")){
                    TextEditor(text: $ReportNotes)
                }
                
                NavigationLink(destination: SubmitView()){
                    Text("Review and Submit")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }.buttonStyle(BigBlueButton())
                
            }
            .navigationTitle(Text("Edit Report"))
        //}
    }
}

struct StationActivity: View {
    var body: some View{
        ScrollView{
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
}

struct StationSelect: View {
    var body: some View{
        ScrollView {
            MapView()
                .frame(height:350)
            Form{
                
            }
        }
    }
}

struct StationForm_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StationForm(/*report: Report(),*/ site: ModelData().Sites[0])
            .environmentObject(modelData)
        
    }
}

//struct StationActivity_Previews: PreviewProvider {
//    static var previews: some View {
//        StationActivity()
//    }
//}
