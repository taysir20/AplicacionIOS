//
//  DataHolder.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 22/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DataHolder: NSObject {
    static let sharedInstance:DataHolder=DataHolder()
        var miUser:String?
        var miPass:String?
        var firDataBaseRef : FIRDatabaseReference!
        var arPerros:Array<Perro>?
    
    func initFireBase(){
        FIRApp.configure()
        firDataBaseRef=FIRDatabase.database().reference()

    }
   
    var locationAdmin:LocationAdmin?
    
    
    
    //variable shareInstance hace referencia así misma una vez. Sola se ejecuta una vez al arrancar la app.
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
}
