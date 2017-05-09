//
//  Perro.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 4/5/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit


class Perro: NSObject {
    
    var sNombre: String?
    var sRaza: String?
    var sEdad: String?
    var dbLat: Double?
    var dbLon: Double?
    var sRutaImagenMascota: String?
    var sRutaColeccionMascota = [String]()
    var img: String?
    
    init(valores:[String:AnyObject]){
        sNombre=valores["Nombre"] as? String
        sRaza=valores["Raza"] as? String
        sEdad=valores["Edad"] as? String
        dbLat=valores["lat"] as? Double
        dbLon=valores["lon"] as? Double
        sRutaImagenMascota=valores["RutaImagenMascota"] as? String
        sRutaColeccionMascota=valores["ColeccionImg"] as! [String]
        
        DataHolder.sharedInstance.numeroImgColeccion=sRutaColeccionMascota.count
        
        for i in 0..<sRutaColeccionMascota.count{
          
                img=sRutaColeccionMascota[i]
            
            
            
            
            
        }
        
    }
    
}
