//
//  ListView.swift
//  AeropuertoApp
//
//  Created by MAC on 22/09/22.
//

import SwiftUI
@MainActor
struct MapListView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @EnvironmentObject var viewModel: APIViewModel
    var listBackgroundColor = AiportColor.background
   var listTextColor = AiportColor.foreground
    @Binding var radius: Float
    var body: some View {
        List {
            ForEach(viewModel.getAllAirports, id:\.id ){ airport in
                Label(airport.name, systemImage: "ipad")
                
            }
        }
        .onAppear()
        {
         Task {
                do {
                    viewModel.radius = radius
                    try await viewModel.getAirports(latitude: locationViewModel.userLocation.center.latitude, longitude: locationViewModel.userLocation.center.longitude)
                } catch {
                    print(error)
                }
            
                
            }
        }
        
    }


/*struct MapListView_Previews: PreviewProvider {
    static var previews: some View {
        MapListView()
    }
}*/
}
