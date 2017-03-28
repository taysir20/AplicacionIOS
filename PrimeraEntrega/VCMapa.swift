//
//  VCMapa.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 28/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import MapKit

class VCMapa: UIViewController, LocationAdminDelegate {
    
    @IBOutlet var miMapa:MKMapView?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.locationAdmin?.delegate=self


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func localizacionActualizada(coordenada: CLLocationCoordinate2D) {
        centralizarEnPosicion(coordenada: coordenada)
    }
    
    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D){
        let region:MKCoordinateRegion = MKCoordinateRegion (center:coordenada,span:MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        miMapa?.setRegion(region, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
