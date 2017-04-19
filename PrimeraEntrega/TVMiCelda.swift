//
//  TableViewCell.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 21/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import FirebaseStorage

class TVMiCelda: UITableViewCell {
    
    @IBOutlet var lblNombreMascota:UILabel?
    @IBOutlet var imgMascota: UIImageView?
    @IBOutlet var lblEdad:UILabel?
    @IBOutlet var lblRaza:UILabel?
    


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func descargaImage(ruta:String){
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
