//
//  InfoPerroViewController.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 9/5/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import MapKit
import Social

class InfoPerroViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var shareFacebook: UIButton!
    @IBOutlet weak var stxtInfo: UITextView!
    @IBOutlet weak var nombreMascota: UILabel!
    @IBOutlet weak var ColeccionFotos: UICollectionView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var shadowView2: UIView!
    @IBOutlet weak var shadowView3: UIView!
    @IBOutlet weak var shadowView4: UIView!
    @IBOutlet weak var sEdad: UILabel!
   
   
    @IBOutlet weak var mapa: UIButton!
    @IBOutlet weak var sSexo: UILabel!
    @IBOutlet weak var imgSexo: UIImageView!
     @IBOutlet weak var sCuidador: UILabel!
     @IBOutlet weak var sTelefono: UILabel!
     @IBOutlet weak var sEmail: UILabel!
    
    
        
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        shadowView?.layer.cornerRadius=3
        shadowView?.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        shadowView?.layer.shadowOffset=CGSize(width:0, height:1.75)
        shadowView?.layer.shadowRadius = 1.7
        shadowView?.layer.shadowOpacity = 0.45
        
        shadowView2?.layer.cornerRadius=3
        shadowView2?.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        shadowView2?.layer.shadowOffset=CGSize(width:0, height:1.75)
        shadowView2?.layer.shadowRadius = 1.7
        shadowView2?.layer.shadowOpacity = 0.45
        
        shadowView3?.layer.cornerRadius=3
        shadowView3?.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        shadowView3?.layer.shadowOffset=CGSize(width:0, height:1.75)
        shadowView3?.layer.shadowRadius = 1.7
        shadowView3?.layer.shadowOpacity = 0.45
        
        shadowView4?.layer.cornerRadius=3
        shadowView4?.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        shadowView4?.layer.shadowOffset=CGSize(width:0, height:1.75)
        shadowView4?.layer.shadowRadius = 1.7
        shadowView4?.layer.shadowOpacity = 0.45
        
      
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func compartirFcebook(_ sender: Any) {
        let perroi:Perro=DataHolder.sharedInstance.arPerros![DataHolder.sharedInstance.indexPerro!]
        var img: UIImage!
        //img = perroi.img!
        
        //alerta
        let alert = UIAlertController(title: "Share", message: "¡Tu amigo de espera!", preferredStyle: .actionSheet)
        //Primera acción
        let actionOne = UIAlertAction(title: "Compartir con Facebook", style: .default) {
            (action) in
            // Comprobamos si el usuario está logueado en facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
                let enviar = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                enviar?.setInitialText(self.stxtInfo!.text);
                enviar?.add(UIImage(named: "per1.jpg"))
                self.present(enviar!, animated: true, completion: nil)
            }else{
                self.verAlerta(service: "Facebook")
            }
        
    }
    //Añadimos la priemra accion a la accion
    alert.addAction(actionOne)
    
    //Presentacion de la alerta
    
    self.present(alert, animated: true, completion: nil)
}

func verAlerta(service: String){
    let alert = UIAlertController(title: "Error", message: "No se ha podido conectar al servidor \(service)", preferredStyle: .alert)
    let action = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
    //Añadimos la accion al alert
    alert.addAction(action)
    // Presentacion del alert
    self.present(alert, animated: true, completion:nil)
}


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(DataHolder.sharedInstance.arPerros==nil){
            return 0
        }else{
            
            return  DataHolder.sharedInstance.arPerros![DataHolder.sharedInstance.indexPerro!].sRutaColeccionMascota.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { // esta funcion funciona como un for que ejecuta cada index
        let cell:CVCMiCeldaColeccionFotos = collectionView.dequeueReusableCell(withReuseIdentifier: "miCeldaColeccion", for: indexPath) as! CVCMiCeldaColeccionFotos
        
        let perroi:Perro=DataHolder.sharedInstance.arPerros![DataHolder.sharedInstance.indexPerro!] //accedo al perro que he seleccionado
        nombreMascota?.text=perroi.sNombre
        cell.descargaImage(ruta: perroi.sRutaColeccionMascota[indexPath.row])//
        
        stxtInfo?.text=perroi.sDescripcionMascota
        sEdad?.text=perroi.sEdad
        sSexo?.text=perroi.sSexo
        sCuidador?.text=perroi.sCuidador
        sTelefono?.text=perroi.sTelefono
        sEmail?.text=perroi.sEmail
        if(perroi.sSexo=="Macho"){
            imgSexo?.image = #imageLiteral(resourceName: "masculine")
            
        }else{
            imgSexo?.image = #imageLiteral(resourceName: "femenine")
        }

        

        return cell;
        
    
        
    }
    
    @IBAction func mostrarMapa(){
          self.performSegue(withIdentifier: "verMapa", sender: self)
    }
}
