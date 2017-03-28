//
//  TableViewCell.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 21/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit

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

}
