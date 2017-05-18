//
//  VCMapa.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 28/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class VCMapa: UIViewController,MKMapViewDelegate /*LocationAdminDelegate */{
    
    @IBAction func muestrameRuta(_ sender: Any) {
        
        let perroi:Perro=DataHolder.sharedInstance.arPerros![DataHolder.sharedInstance.indexPerro!]
        let latitude:CLLocationDegrees = 36.762975//perroi.dbLat!
        let longitude:CLLocationDegrees = -4.241126//perroi.dbLon!
        let distancia:CLLocationDistance=1000
        let coordenada = CLLocationCoordinate2DMake(latitude,longitude)
        let region = MKCoordinateRegionMakeWithDistance(coordenada,distancia,distancia)
        let opciones=[MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: region.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: region.span)]
        let placemark = MKPlacemark(coordinate: coordenada)
        let mapItem = MKMapItem(placemark:placemark)
        mapItem.name=perroi.sNombre!
        mapItem.openInMaps(launchOptions: opciones)
    }
    /*@IBOutlet var miMapa:MKMapView?
    var pines:[String:MKAnnotation]?=[:]// inicializamos el hashMap de pines a vacío
   */
    override func viewDidLoad() {
        super.viewDidLoad()
        //DataHolder.sharedInstance.locationAdmin?.delegate=self
       // miMapa?.showsUserLocation=true // Fuerza para mostrar la localización del usuario en el mapa y recurrimos al MKMapViewDelegate para usar el método mapView que nos dan la última posición del usuario.
        
        // Do any additional setup after loading the view.
        
        /*
        let perroi:Perro=DataHolder.sharedInstance.arPerros![DataHolder.sharedInstance.indexPerro!]

                      // Este for se encargará de ir recorriendo el arTemp y sacando los datos del FireBase para que se
            // guarden en otro ArrayList (perroi) y se vayan mostrando
        
                             var coordTemp:CLLocationCoordinate2D=CLLocationCoordinate2D()
                coordTemp.latitude = perroi.dbLat!
                coordTemp.longitude = perroi.dbLon!
                self.agregarPin(coordenada: coordTemp, lugar: perroi.sNombre!)
        
            
         */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   /* func localizacionActualizada(coordenada: CLLocationCoordinate2D) {
        centralizarEnPosicion(coordenada: coordenada)
    }
    */
    //Se trata del método con el que se agregan pines para las localizaciones que deseemos
    /*func agregarPin(coordenada:CLLocationCoordinate2D, lugar varLugar:String){
        
        var annotation:MKPointAnnotation=MKPointAnnotation() //anotación de un punto determinado
        // Con estas condiciones conseguimos actualizar en tiempo real la posición de un perro, borrando su posición
        //anterior
        if(pines?[varLugar]==nil){
            
        }else{
            annotation=pines?[varLugar] as! MKPointAnnotation
            miMapa?.removeAnnotation(annotation)
        }
        annotation.coordinate=coordenada // se trata de la coordenada de dicha anotación
        annotation.title=varLugar // a la anotación se le agrega un título que es el de nuestra variable título
        pines?[varLugar]=annotation//se añade la nueva anotación es decir, la nueva posición
        miMapa?.addAnnotation(annotation)
        
    }

    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D){
        let region:MKCoordinateRegion = MKCoordinateRegion (center:coordenada,span:MKCoordinateSpan(latitudeDelta: 10.5, longitudeDelta: 0.05))
       miMapa?.setRegion(region, animated: true)
    }
    
    
    //Método que nos da la última posición del usuario
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        centralizarEnPosicion(coordenada: userLocation.coordinate) // cada vez que se cambie de posición se llama
        // al método "centralizarEnPosicion" y y se centra la nueva localización
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
