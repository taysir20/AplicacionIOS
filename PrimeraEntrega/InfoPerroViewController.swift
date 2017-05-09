//
//  InfoPerroViewController.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 9/5/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit

class InfoPerroViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    
    @IBOutlet weak var scrollInfo: UIScrollView!
    @IBOutlet weak var segmentoInfo: UISegmentedControl!
    @IBOutlet weak var nombreMascota: UILabel!
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
    
    @IBAction func cambiarSegmento(_ sender: Any) {
        
        if(segmentoInfo.selectedSegmentIndex==0){
            ColeccionFotos.isHidden = false
        }else{
            ColeccionFotos.isHidden = true
        }
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

        return cell;
        
    }

}
