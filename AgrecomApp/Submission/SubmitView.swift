//
//  SubmitView.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/23/21.
//

import SwiftUI

struct SubmitView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSubmitAlert = false;
    
    var body: some View {
        Form {
            Section(header: Text("Report Information")){
                Text("Report ID: " + "000001")
                // placeholder report id
                Text("Username: " + "test_user")
                // placeholder username
            }
            
            Section(header: Text("Report Content")){
                Text("Stations with Activity: none")
                Text("Stations Inaccessible: none")
                Text("Stations Damaged: none")
                Text("Bait Used: Jaguar")
                Text("Bait Notes: \n")
                Text("Vegetation Status: Medium")
                Text("Station Codes Added: none")
                Text("Corrective Reccomendation: \n\n")
                Text("Additional Notes: \n\n")
                
            }
            
            .alert(isPresented: $showingSubmitAlert, content: {
                Alert(
                    title: Text("Report Submitted"),
                    message: Text("Submitted with ID 000001 to Site 10001"),
                    dismissButton: .default(Text("Dismiss"))
                )
            })
            
            
            HStack{
                Button(
                    "Edit Report",
                    action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                )
                Spacer()
                Button(
                    "Return to Sites",
                    action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                )
            }
            Button(
                "Submit Report",
                action:{
                    //TODO
                    showingSubmitAlert = true
                }
            ).buttonStyle(BigBlueButton())
        }
        
                
        .navigationTitle(Text("Review Report"))
    }
}

struct SubmitView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitView()
    }
}
