//
//  CVCMiCeldaColeccionFotos.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 4/5/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit

class CVCMiCeldaColeccionFotos: UICollectionViewCell {
    
   
    @IBOutlet var imgMascota: UIImageView?
    
    func descargaImgColeccion(ruta:String){
        // Create a reference to the file you want to download
        let islandRef = DataHolder.sharedInstance.firStorageRef?.child(ruta)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef?.data(withMaxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                self.imgMascota?.image=image
            }
        }
    }
    
    
}



    


