//
//  VCPrincipal.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 21/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit

class VCPrincipal: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tbMiTable:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVMiCelda = tableView.dequeueReusableCell(withIdentifier: "miCelda")! as! TVMiCelda
        //cell.lblNombreMascota?.text="Tay"
        if (indexPath.row==0) {
            cell.lblNombreMascota?.text="Coco"
            cell.imgMascota?.image=#imageLiteral(resourceName: "perritoinch")
            cell.lblEdad?.text="2 años"
            cell.lblRaza?.text="Cruce Dogo-P.Alemán"
        }else if (indexPath.row==1){
            cell.lblNombreMascota?.text="Toby"
            cell.imgMascota?.image=#imageLiteral(resourceName: "odd_tonik_3-660x350")
            cell.lblEdad?.text="6 meses"
            cell.lblRaza?.text="Cruce B.Maltés-Samoyedo"
        }else if (indexPath.row==2){
            cell.lblNombreMascota?.text="Blanca"
            cell.imgMascota?.image=#imageLiteral(resourceName: "1zcn9r7")
            cell.lblEdad?.text="4 años"
            cell.lblRaza?.text="Gran Danés"
        }else if (indexPath.row==3){
            cell.lblNombreMascota?.text="Salen"
            cell.imgMascota?.image=#imageLiteral(resourceName: "Perrito")
            cell.lblEdad?.text="1 año"
            cell.lblRaza?.text="Cruce P.Alemán"
        }else if (indexPath.row==4){
            cell.lblNombreMascota?.text="Luna"
            cell.imgMascota?.image=#imageLiteral(resourceName: "perros-graciosos-7")
            cell.lblEdad?.text="9 meses"
            cell.lblRaza?.text="Cruce Pitbull"
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
