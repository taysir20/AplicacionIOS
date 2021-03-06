//
//  MisPerros.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 8/6/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MisPerros: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tbMiTable:UITableView?
    var UserId: String?
    var count: Int=0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mediante el DataHolder se dice que se observe la raíz "Perros" del FireBase y al
        //estar el código en la función viewDidLoad() entonces se ejecutará siempre que carguemos
        // la tabla de la app. De este modo nos devuelve los datos de la rama coches en forma de array.
        //observeSingleEvent se usa para que no cargue siempre la lista de datos y no gastar en exceso la tarifa
        // plana del usuario
        
        //print("------------->>>>>>>>>>>>> ", DataHolder.sharedInstance.uid)
        
        DataHolder.sharedInstance.firDataBaseRef.child("Perros").queryOrdered(byChild: "uid").queryEqual(toValue: DataHolder.sharedInstance.uid).observeSingleEvent(of: .value, with: {(snapshot)
            in
            // Con el método observeSingleEvent lo que hacemos es evitar que se produzcan duplicados ya que con "obseve"
            // si se producen. El inconveniente es que no se actualizaría en tiempo real los cambios de la base de datos
            // y habría que volver a cargar la aplicación.
            let arTemp=snapshot.value as? Array<AnyObject>
            DataHolder.sharedInstance.arPerros=Array<Perro>()
            // Este for se encargará de ir recorriendo el arTemp y sacando los datos del FireBase para que se
            // guarden en otro ArrayList (perroi) y se vayan mostrando
           for co in arTemp! as [AnyObject]{
                let perroi=Perro(valores: co as! [String:AnyObject])
                DataHolder.sharedInstance.arPerros?.append(perroi)
            }
            
            
            
            
            
            
            self.tbMiTable?.reloadData()
            
        })
    }
    
    
        // Do any additional setup after loading the view.
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(DataHolder.sharedInstance.arPerros==nil){
            return 0
        }else{
            let numPerros=DataHolder.sharedInstance.arPerros?.count;
            DataHolder.sharedInstance.numPerros=numPerros;
            
            return  (DataHolder.sharedInstance.arPerros?.count)!
            
           
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell:TVMiCelda2 = tableView.dequeueReusableCell(withIdentifier: "miCelda2")! as! TVMiCelda2
        
        // en la variable perroi, para cada posición del arrayList se irán sobrescribiendo con los nuevos
        //valores del perro.
        let perroi:Perro=DataHolder.sharedInstance.arPerros![indexPath.row]
        
        cell.lblNombreMascota?.text=perroi.sNombre
        cell.lblEdad?.text=perroi.sEdad
        cell.lblRaza?.text=perroi.sRaza
        cell.imgMascota?.layer.cornerRadius = (cell.imgMascota?.frame.size.width)! / 2;
        cell.imgMascota?.layer.masksToBounds = true;
        
        cell.imgMascota?.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        cell.imgMascota?.layer.shadowOffset=CGSize(width:0, height:1.75)
        cell.imgMascota?.layer.shadowRadius = 1.7
        cell.imgMascota?.layer.shadowOpacity = 0.45
        cell.descargaImage(ruta: perroi.sRutaImagenMascota!)
        if(perroi.sSexo=="Macho"){
            cell.imgSexo?.image = #imageLiteral(resourceName: "masculine")
            
        }else{
            cell.imgSexo?.image = #imageLiteral(resourceName: "femenine")
        }
        
        
        
        return cell
        
    }
    
    //TUVILLA
    //Método que accede al contenido de cada perro al seleccionar una fila de la tabla es decir al seleccioanar una celda
        /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
