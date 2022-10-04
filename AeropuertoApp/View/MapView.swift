//
//  ViewMap.swift
//  AeropuertoApp
//
//  Created by MAC on 21/09/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @EnvironmentObject var viewModel: APIViewModel
    @Binding var radius: Float
        var body: some View {

            Map(coordinateRegion: $locationViewModel.userLocation, annotationItems: viewModel.getAllAirports, annotationContent: { airport in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: airport.latitude, longitude: airport.longitude), tint: .red)
            })
            .onAppear() {
                Task {
                    do {
                locationViewModel.checkIfLocationServicesIsEnabled()
                print("location user task: \(String(describing: locationViewModel.userLocation))")
                viewModel.radius = radius
                viewModel.getAirports(latitude: locationViewModel.userLocation.center.latitude, longitude: locationViewModel.userLocation.center.longitude)
                    } catch {
                        print(error)
                    }
                }
            }
               
        }
    
    
}
