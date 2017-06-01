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
    var sSexo: String?
    var sRutaImagenMascota: String?
    var sDescripcionMascota: String?
    var sRutaColeccionMascota = [String]()
    var sCuidador: String?
    var sTelefono:String?
    var sEmail: String?
    
    override init(){
        super.init()
        sNombre=""
        sRaza=""
        dbLat=0
        dbLon=0
        sSexo=""
        sRutaImagenMascota=""
        sDescripcionMascota=""
        sCuidador=""
        sTelefono=""
        sEmail=""
    }
    init(valores:[String:AnyObject]){
        sNombre=valores["Nombre"] as? String
        sRaza=valores["Raza"] as? String
        sEdad=valores["Edad"] as? String
        sSexo=valores["Sexo"] as? String
        dbLat=valores["lat"] as? Double
        dbLon=valores["lon"] as? Double
        sRutaImagenMascota=valores["RutaImagenMascota"] as? String
        sRutaColeccionMascota=valores["ColeccionImg"] as! [String]
        sDescripcionMascota=valores["Descripcion"] as? String
        sCuidador=valores["Cuidador"] as? String
        sTelefono=valores["Telefono"] as? String
        sEmail=valores["Email"] as? String

        
    
        
            
            
        }
    
    func getDiccionary()->[String:AnyObject]{
        var hm:[String:AnyObject]=[:]
        hm["Nombre"]=sNombre! as AnyObject
        hm["Raza"]=sRaza! as AnyObject
        hm["Edad"]=sEdad! as AnyObject
        hm["Sexo"]=sSexo! as AnyObject
        hm["RutaImagenMascota"]=sRutaImagenMascota! as AnyObject?
        hm["ColeccionImg"]=sRutaColeccionMascota as AnyObject
        hm["lat"]=dbLat! as AnyObject
        hm["lon"]=dbLon! as AnyObject
        hm["Descripcion"]=sDescripcionMascota! as AnyObject
        hm["Cuidador"]=sCuidador! as AnyObject
        hm["Telefono"]=sTelefono! as AnyObject
        hm["Email"]=sEmail! as AnyObject
        
        return hm
    }
        
    }
    

