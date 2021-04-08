//
//  SiteListPage.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/16/21.
//

import SwiftUI

struct SiteListPage: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredSites: [Site] {
        modelData.Sites.filter { Site in
            (!showFavoritesOnly || Site.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Show Favorites Only")
                }
                ForEach(filteredSites){ Site in
                    NavigationLink(destination: SiteDetails(site: Site)){
                        SiteList(site: Site)
                    }
                }
                .navigationTitle("Sites")
            }
        }
    }
}

struct SiteListPage_Previews: PreviewProvider {
    static var previews: some View {
        SiteListPage()
            .environmentObject(ModelData())
            
    }
}
