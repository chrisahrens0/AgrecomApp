//
//  ReportList.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 5/9/21.
//

import SwiftUI

struct ReportList: View {
    var body: some View {
        //navigationTitle("Report List")
        List{
            NavigationLink(destination: SubmitView()){
                HStack{
                    Text("Report ID: 10000")
                    Spacer()
                    Text("04/26/2021")
                }
            }
            //Text("Test")
        }
        .navigationBarTitle(Text("Report List"))
    }
}

struct ReportList_Previews: PreviewProvider {
    static var previews: some View {
        ReportList()
    }
}
