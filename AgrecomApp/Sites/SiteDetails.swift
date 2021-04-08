//
//  SiteDetails.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/16/21.
//

import SwiftUI

struct SiteDetails: View {
    @EnvironmentObject var modelData:ModelData
    var site: Site
    
    var siteIndex: Int {
        modelData.Sites.firstIndex(where: { $0.id == site.id })!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
//            Image("AgrecomLogo")
//                .resizable()
//                .scaledToFill()
//                .frame(width:150, height:65)
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
            Text(site.description)
                .font(.body)
            
            Spacer()
        }
        .padding()
    }
}

struct SiteDetails_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        SiteDetails(site: ModelData().Sites[0])
            .environmentObject(modelData)
    }
}
