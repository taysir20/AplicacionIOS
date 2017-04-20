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
    var locationAdmin:LocationAdmin?
        var miUser:String?
        var miPass:String?
        var firDataBaseRef : FIRDatabaseReference!
        var firStorage:FIRStorage?
        var firStorageRef:FIRStorageReference?
        var arPerros:Array<Perro>?
    
    //Variables para switch
        var sEmail:String?
        var sPass:String?
    
    func initFireBase(){
        FIRApp.configure()
        firDataBaseRef=FIRDatabase.database().reference()
        firStorage = FIRStorage.storage()
        firStorageRef=firStorage?.reference()

    }
   
    
    
    
    
    //variable shareInstance hace referencia así misma una vez. Sola se ejecuta una vez al arrancar la app.
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    
    func loadData(){
        let props = UserDefaults.standard
        sEmail=props.string(forKey: "email_login")
        sPass=props.string(forKey: "pass_login")
        
    }
    func saveData(){
         let props = UserDefaults.standard
        props.setValue(sEmail, forKey: "email_login")
        props.setValue(sPass, forKey: "pass_login")
        props.synchronize()
    }
}
