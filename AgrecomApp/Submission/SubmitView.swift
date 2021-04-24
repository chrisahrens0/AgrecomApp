//
//  SubmitView.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/23/21.
//

import SwiftUI

struct SubmitView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("Report Information")){
                Text("Report ID: " + "000001")
                // placeholder report id
                Text("Username: " + "test_user")
                // placeholder username
            }
            Button(
                "Return to Site List",
                action: {
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
        
                
        .navigationTitle(Text("Review Report"))
    }
}

struct SubmitView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitView()
    }
}
