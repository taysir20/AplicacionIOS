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
import FirebaseStorage

class DataHolder: NSObject {
    static let sharedInstance:DataHolder=DataHolder()
        var miUser:String?
        var miPass:String?
        var firDataBaseRef : FIRDatabaseReference!
        var firStorage:FIRStorage?
        var firStorageRef:FIRStorageReference?
        var arPerros:Array<Perro>?
    
    func initFireBase(){
        FIRApp.configure()
        firDataBaseRef=FIRDatabase.database().reference()
        firStorage = FIRStorage.storage()
        firStorageRef=firStorage?.reference()

    }
   
    var locationAdmin:LocationAdmin?
    
    
    
    //variable shareInstance hace referencia así misma una vez. Sola se ejecuta una vez al arrancar la app.
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
}
