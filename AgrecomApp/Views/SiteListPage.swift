//
//  SiteListPage.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 2/16/21.
//

import SwiftUI

struct SiteListPage: View {
    var body: some View {
        List(Sites){ Site in
            SiteList(site: Site)
        }
    }
}

struct SiteListPage_Previews: PreviewProvider {
    static var previews: some View {
        SiteListPage()
    }
}
