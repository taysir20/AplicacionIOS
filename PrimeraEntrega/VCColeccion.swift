//
//  VCColeccion.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 22/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class VCColeccion: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet var colPrincipal:UICollectionView?
    
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
            self.colPrincipal?.reloadData()
            
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
        let cell:CVCMiCelda2 = collectionView.dequeueReusableCell(withReuseIdentifier: "miCelda2", for: indexPath) as! CVCMiCelda2
        let perroi:Perro=DataHolder.sharedInstance.arPerros![indexPath.row]
        cell.lblNombreMascota?.text=perroi.sNombre
        cell.descargaImage(ruta: perroi.sRutaImagenMascota!)
        
        /*if (indexPath.row==0) {
            cell.lblNombreMascota?.text="Coco"
            cell.imgMascota?.image=#imageLiteral(resourceName: "perritoinch")
            
        }else if (indexPath.row==1){
            cell.lblNombreMascota?.text="Toby"
            cell.imgMascota?.image=#imageLiteral(resourceName: "odd_tonik_3-660x350")
           
        }else if (indexPath.row==2){
            cell.lblNombreMascota?.text="Blanca"
            cell.imgMascota?.image=#imageLiteral(resourceName: "1zcn9r7")
           
        }else if (indexPath.row==3){
            cell.lblNombreMascota?.text="Salen"
            cell.imgMascota?.image=#imageLiteral(resourceName: "Perrito")
          
        }else if (indexPath.row==4){
            cell.lblNombreMascota?.text="Luna"
            cell.imgMascota?.image=#imageLiteral(resourceName: "perros-graciosos-7")
           
        }
 */
        
        return cell

    }
    
   
 
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


