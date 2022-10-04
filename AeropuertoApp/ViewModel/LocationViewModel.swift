//
//  LocationViewModel.swift
//  AeropuertoApp
//
//  Created by MAC on 22/09/22.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI
@MainActor
final class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

     var locationManager: CLLocationManager?
    @Published var userLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -54.010, longitude: -68.315), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    

    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled()
        {
           
            print("is Enabled")
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.startUpdatingLocation()
            locationManager!.delegate = self
        } else
        {
            print("Esta aplicacion no puede acceder a tu ubicaciòn, autoriza su uso")
        }
    }
    
    func checkLocationAuthorization()
    {
        guard let locationManager = locationManager else {return}
        
        switch CLLocationManager.authorizationStatus()
        {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Tu localizacion esta restringida")
        case .denied:
            print("Tu localizacion esta restringida")
        case .authorizedAlways, .authorizedWhenInUse:
            print("autorizada")
            userLocation = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                              span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            print("location user manager: \(String(describing: userLocation))")
            break
         default:
            break
        }

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}



