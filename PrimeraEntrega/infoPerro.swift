//
//  infoPerro.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 4/5/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class infoPerro: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet var col:UICollectionView?
    //@IBOutlet var viewImagenAmpliada:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.firDataBaseRef.child("Perros").observeSingleEvent(of: .value, with: {(snapshot)
            in
            let arTemp=snapshot.value as? Array<AnyObject>
            
            DataHolder.sharedInstance.arPerros=Array<Perro>()
            // Este for se encargará de ir recorriendo el arTemp y sacando los datos del FireBase para que se
            // guarden en otro ArrayList (perroi) y se vayan mostrando
            for co in arTemp! as [AnyObject]{
                let perroi=Perro(valores: co as! [String:AnyObject])
                DataHolder.sharedInstance.arPerros?.append(perroi)
            }
            self.col?.reloadData()
            
        })
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(DataHolder.sharedInstance.arPerros==nil){
            return 0
        }else{
            return  (DataHolder.sharedInstance.arPerros?.count)!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCeldaColeccionFotos = collectionView.dequeueReusableCell(withReuseIdentifier: "coleccionImg", for: indexPath) as! CVCMiCeldaColeccionFotos
        let perroi:Perro=DataHolder.sharedInstance.arPerros![indexPath.row]
        cell.descargaImgColeccion(ruta: perroi.sRutaImagenMascota!)
               return cell
        
    }

    
   
}
