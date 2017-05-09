//
//  InfoPerroViewController.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 9/5/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit

class InfoPerroViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet weak var ColeccionFotos: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(DataHolder.sharedInstance.arPerros==nil){
            return 0
        }else{
            return  (DataHolder.sharedInstance.arPerros?.count)!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCeldaColeccionFotos = collectionView.dequeueReusableCell(withReuseIdentifier: "miCeldaColeccion", for: indexPath) as! CVCMiCeldaColeccionFotos
        
        let perroi:Perro=DataHolder.sharedInstance.arPerros![indexPath.row]
        
        
        cell.descargaImage(ruta: perroi.img!)


        return cell;
        
    }

}
