//
//  LocationAdmin.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 28/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import CoreLocation
class LocationAdmin: NSObject, CLLocationManagerDelegate {

    var locationManager:CLLocationManager?
    var delegate:LocationAdminDelegate?
    
    override init(){
        super.init()
        
        locationManager=CLLocationManager()
        locationManager?.delegate=self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
        
    }
    
    /*func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Mi posicición en lat: ", locations[0].coordinate.latitude, " longitud: ", locations[0].coordinate.longitude)
        delegate?.localizacionActualizada(coordenada:locations[0].coordinate)
    }
    */
    
}


protocol LocationAdminDelegate{
    func localizacionActualizada(coordenada:CLLocationCoordinate2D)
    
    
}
