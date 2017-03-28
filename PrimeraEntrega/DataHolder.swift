//
//  DataHolder.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 22/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import Firebase

class DataHolder: NSObject {
    static let sharedInstance:DataHolder=DataHolder()
        var miUser:String?
        var miPass:String?
    
    func initFireBase(){
        FIRApp.configure()

    }
   
    var locationAdmin:LocationAdmin?
    
    
    
    //variable shareInstance hace referencia así misma una vez. Sola se ejecuta una vez al arrancar la app.
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
}
