//
//  MainTabView.swift
//  AeropuertoApp
//
//  Created by MAC on 22/09/22.
//

import SwiftUI
@MainActor
struct MainTabView: View {
    @StateObject var viewModel: APIViewModel = APIViewModel()
    @StateObject var locationViewModel = LocationViewModel()
    
    @Binding var radius: Float
    var body: some View {
        TabView {
            MapView(radius: $radius).environmentObject(viewModel).environmentObject(locationViewModel)
                .tabItem { Label("Map", systemImage: "heart.fill" ) }
            NavigationView {
                MapListView(radius: $radius).environmentObject(viewModel).environmentObject(locationViewModel)
            }.tabItem { Label("List", systemImage: "list.dash") }
           
        } 
        
    }
}

/*struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
} */
