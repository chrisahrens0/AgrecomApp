//
//  SiteList.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/15/21.
//

import SwiftUI

struct SiteList: View {
    var site: Site
    
    var body: some View {
        HStack {
            Text(String(site.id) + ": " + site.siteName)
                .padding()
            Spacer()
//            Text(String(site.addressLine1))
//                .padding()
            
            if(site.isFavorite) {
                Image(systemName: "star.fill")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct SiteList_Previews: PreviewProvider {
    static var Sites = ModelData().Sites
    static var previews: some View {
        Group {
            SiteList(site: Sites[0])
            SiteList(site: Sites[1])
        }
        .previewLayout(.sizeThatFits)
    }
}
