//
//  VCColeccion.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 22/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit

class VCColeccion: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet var colPrincipal:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCelda2 = collectionView.dequeueReusableCell(withReuseIdentifier: "miCelda2", for: indexPath) as! CVCMiCelda2
        if (indexPath.row==0) {
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
        
        return cell

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
