//
//  TVMiCelda2.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 8/6/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import FirebaseStorage

class TVMiCelda2: UITableViewCell {
    
    @IBOutlet var lblNombreMascota:UILabel?
    @IBOutlet var imgMascota: UIImageView?
    @IBOutlet var lblEdad:UILabel?
    @IBOutlet var lblRaza:UILabel?
    @IBOutlet var imgSexo: UIImageView?
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func descargaImage(ruta:String){ // pasamos por parametro la ruta de las imagenes que se encuentran en el FireBase
        // Create a reference to the file you want to download
        let islandRef = DataHolder.sharedInstance.firStorageRef?.child(ruta) //esta ruta que se ha obtenido en el
        //DataHolder se almacena en la constante islandRef. De modo que si no hay ningún error al descargar su ruta
        //entonces se devuelve la imagen que se guarda en la variable imgMascota que es la variable ligada y conectada
        // con el UIImageView. Este proceso se repite para la colección.
        
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

