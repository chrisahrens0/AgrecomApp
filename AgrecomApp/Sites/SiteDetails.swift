//
//  SiteDetails.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/16/21.
//

import SwiftUI

struct BigBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0.5, blue: 0.9))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct SiteDetails: View {
    @EnvironmentObject var modelData:ModelData
    var site: Site
    
    var siteIndex: Int {
        modelData.Sites.firstIndex(where: { $0.id == site.id })!
    }
    
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
//                Image("AgrecomLogo")
//                    .resizable()
//                    .fixedSize()
                HStack{
                    Text(site.siteName)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.Sites[siteIndex].isFavorite)
                }
                Text(site.addressLine1)
                    .font(.subheadline)
                Text(site.addressLine2 + "\n")
                    .font(.subheadline)
                Text(verbatim: "Site ID: \(site.id)")
                Text("Category: \(site.category)")
                Text("\n")
                Text(site.description)
                    .font(.body)
                
                Spacer()
                NavigationLink(destination: FormPageTest()){
                    Text("Start Report")
                }.buttonStyle(BigBlueButton())
            }
        }
        .navigationBarTitle(site.siteName+": Site Information")
    }
}

struct FormPageTest: View {
    var body: some View {
        Text("You got here")
    }
}

struct SiteDetails_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        SiteDetails(site: ModelData().Sites[0])
            .environmentObject(modelData)
    }
}
