//
//  MultiRowSelect.swift
//  AgrecomApp
//
//  Created by Chris Ahrens on 4/23/21.
//

import SwiftUI

struct MultiRowSelect: View {
    var station: Station
    @Binding var selectedItems: Set<UUID>
    var isSelected: Bool {
        selectedItems.contains(station.id)
    }
    
    
    var body: some View {
        HStack{
            Text("Station \(self.station.stationID)")
                .font(.title)
            Spacer()
            if(self.isSelected) {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.blue)
                
            }
        }
        .onTapGesture {
            if(self.isSelected){
                self.selectedItems.remove(self.station.id)
            } else {
                self.selectedItems.insert(self.station.id)
            }
        }
    }
}

//struct MultiRowSelect_Previews: PreviewProvider {
//    static var previews: some View {
//        MultiRowSelect()
//    }
//}
