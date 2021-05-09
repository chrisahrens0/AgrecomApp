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
    
    public enum StationActivity: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }
        
        case none
        case rodent
        case reptile
        case insect
        case other
    }
    @State public var selectedActivity = StationActivity.none
    
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
                    NavigationLink(destination: StationActivityPage()) {
                        Text("Select Stations with Activity")
                    }
                    NavigationLink(destination: StationsInaccessible()){
                        Text("Select Inaccessible Stations")
                    }
                    
                    NavigationLink(destination: StationsDamaged()) {
                        Text("Select Damaged Stations")
                    }
                    
//                    NavigationLink(destination: StationActivityPage()){
//                        Text("Add New Station QR Codes")
//                    }
//                    //Replaced by CodeScannerView Link
                    
                    NavigationLink(destination: CodeScannerView(codeTypes: [.qr]) {
                        result in
                        switch result {
                        case .success(let code):
                            //stations.append(Station(qrCode: code))
                            print("found code: \(code)")
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                        
                    }){
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

struct StationActivityPage: View {
    
    @State private var stationCode: String = ""
    
    public enum StationActivity: String, CaseIterable, Identifiable {
        var id: String { self.rawValue }

        case none
        case rodent
        case reptile
        case insect
        case other
    }
    @State public var selectedActivity = StationActivity.none
    
    var body: some View{
        Form{
            Image("AgrecomLogo")
            MapView()
                .frame(height: 300)
            Text("Placeholder Map: to be edited by Agrecom")
                //.padding()
            //Text("selects from list of sites, display site picture")
            
            Section(header: Text("Station Select")){
                NavigationLink(destination: CodeScannerView(codeTypes: [.qr]) {
                    result in
                    switch result {
                    case .success(let code):
                        //stations.append(Station(qrCode: code))
                        print("found code: \(code)")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                }){
                    Text("Scan Station Code with Activity")
                }
                
                TextField("Enter Station Code Manually", text: $stationCode)
            }
            
            Picker(selection: $selectedActivity, label: Text("Type of Activity")) {
                Text("None").tag(StationActivity.none)
                Text("Rodent").tag(StationActivity.rodent)
                Text("Insect").tag(StationActivity.insect)
                Text("Reptile").tag(StationActivity.reptile)
                Text("Other").tag(StationActivity.other)
            }
        }
    }
}

struct StationsInaccessible: View {
    
    @State private var stationCode: String = ""
    
    var body: some View{
        Form{
            Image("AgrecomLogo")
            MapView()
                .frame(height: 300)
            Text("Placeholder Map: to be edited by Agrecom")
                //.padding()
            //Text("selects from list of sites, display site picture")
            
            Section(header: Text("Station Select")){
                
                TextField("Enter Station Code Manually", text: $stationCode)
            }
        }
    }
}

struct StationsDamaged: View {
    
    @State private var stationCode: String = ""
    
    
    var body: some View{
        Form{
            Image("AgrecomLogo")
            MapView()
                .frame(height: 300)
            Text("Placeholder Map: to be edited by Agrecom")
                //.padding()
            //Text("selects from list of sites, display site picture")
            
            Section(header: Text("Station Select")){
                NavigationLink(destination: CodeScannerView(codeTypes: [.qr]) {
                    result in
                    switch result {
                    case .success(let code):
                        //stations.append(Station(qrCode: code))
                        print("found code: \(code)")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                }){
                    Text("Scan Station Code with Activity")
                }
                
                TextField("Enter Station Code Manually", text: $stationCode)
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
        //StationsInaccessible()
        
    }
}

//struct StationActivity_Previews: PreviewProvider {
//    static var previews: some View {
//        StationActivity()
//    }
//}
