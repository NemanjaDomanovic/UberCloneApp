//
//  LocationManager.swift
//  UberCloneApp
//
//  Created by Nemanja Domanovic on 12/5/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()                                                    //super konstruktor
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest       //učitavanje najpreciznije lokacije
        locationManager.requestWhenInUseAuthorization()                 //traženje dozvole za pristup lokaciji
        locationManager.startUpdatingLocation()                         //započinjanje ažuriranja lokacije
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        guard !locations.isEmpty else {return}
        locationManager.stopUpdatingLocation()                          //funkcija koja se ponavlja a služi ažuriranju lokacije
    }
}


