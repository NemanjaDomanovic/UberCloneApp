//
//  UberMapViewRepresentable.swift
//  UberCloneApp
//
//  Created by Nemanja Domanovic on 12/5/24.
//

import SwiftUI    //učitavanje framework-a za Mape i Swift korisnički interfejs.
import MapKit


struct UberMapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()                                       //definisanje atributa mapView i locationManager
    let locationManager = LocationManager()
    
    func makeUIView(context: Context) -> some UIView {              //funkcija za integrisanje mape u SwiftUI
        
        mapView.delegate = context.coordinator                      //davanje privilegija delegate da kontroliše događaje
        mapView.isRotateEnabled = false                             //onemogućivanje rotacije mape u aplikaciji
        mapView.showsUserLocation = true                            //prikazivanje trenutne lokacije korisnika na mapi
        mapView.userTrackingMode = .follow                          //praćenje lokacije korisnika dok se kreće na mapi
        
        return mapView                                              //vraćanje konfigurisane mape u SwiftUI interfejs
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {     //funkcija za ažuriranje pregleda Mape
        
    }
    
    func makeCoordinator() -> MapCoordinator {                      //inicijalizacija (pravljenje) koordinatora
        return  MapCoordinator(parent: self)
    }
}
    
extension UberMapViewRepresentable {                                //pomoćna klasa MapCoordinator za upravljanje događajima
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: UberMapViewRepresentable
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        func mapView(_ mapView: MKMapView, didUpdate userlocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userlocation.coordinate.latitude, longitude: userlocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) )
            parent.mapView.setRegion(region, animated: true)
        }
    }
        
    //funkcija za ažuriranje lokacije u samoj aplikaciji kada se učita mapa, kao i inicijalizacija animacije i regiona
}
