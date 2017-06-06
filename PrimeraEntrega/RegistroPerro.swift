//
//  RegistroPerro.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 25/5/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class RegistroPerro: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imgPicker = UIImagePickerController()
    @IBOutlet weak var btnCamara: UIButton!
    @IBOutlet weak var btnGaleria: UIButton!
    @IBOutlet weak var imgSelfie: UIImageView!
    @IBOutlet weak var nombreMascota: UITextField!
    @IBOutlet weak var razaPerro: UITextField!
    @IBOutlet weak var edadPerro: UITextField!
    @IBOutlet weak var sexoPerro: UISegmentedControl!
    @IBOutlet weak var descripcionPerro: UITextView!
    @IBOutlet weak var nombreCuidador: UITextField!
    @IBOutlet weak var telefonoCuidador: UITextField!
    @IBOutlet weak var emailCuidador: UITextField!
    @IBOutlet weak var enviarNuevoPerro: UIButton!
    var imgData:Data?
    let randNum = arc4random_uniform(1000000000)
    let miperro = Perro()
    var rutaImg:String!

    @IBAction func abrirGaleria(_ sender: Any) {
        
        imgPicker.allowsEditing=false
        imgPicker.sourceType = .photoLibrary
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    
    @IBAction func abrirCamara(_ sender: Any) {
        
        imgPicker.allowsEditing=false
        imgPicker.sourceType = .camera
        self.present(imgPicker, animated: true, completion: nil)
    
    }
    func RandomInt(min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    @IBAction func subirImg(_ sender: Any) {
        
       
        
        rutaImg=String(format:"Perros/perro%d.jpg", RandomInt(min: 0,max: Int(randNum)))
        let imgRefPerfil = DataHolder.sharedInstance.firStorageRef?.child(rutaImg)
        let uploadTaskPerfil = imgRefPerfil?.put(imgData!, metadata:nil){ (metadata,error)
            in
            guard let metadata = metadata else{
                return
            }
            let downloadURL = metadata.downloadURL
        }
        
        //Nos posicionamos en la raiz del sistema de archivos
        let imgRef = DataHolder.sharedInstance.firStorageRef?.child(String(rutaImg))
        let uploadTask = imgRef?.put(imgData!, metadata:nil){ (metadata,error)
            in
            guard let metadata = metadata else{
                return
            }
            let downloadURL = metadata.downloadURL
            

        }

    }
    
    
    @IBAction func enviarDatosNuevoPerro(_ sender: Any) {
        
        miperro.sNombre=nombreMascota.text
        miperro.sRaza=razaPerro.text
        miperro.sEdad = edadPerro.text
        miperro.sEdad = edadPerro.text
       
        if(sexoPerro.selectedSegmentIndex==0){
             miperro.sSexo = "Hembra"
        }else if(sexoPerro.selectedSegmentIndex==1){
            miperro.sSexo = "Macho"
        }
        
        miperro.sDescripcionMascota = descripcionPerro.text
        miperro.sCuidador = nombreCuidador.text
        miperro.sTelefono = telefonoCuidador.text
        miperro.sEmail = emailCuidador.text
        miperro.sRutaImagenMascota=String(format:"Perros/perro%d.jpg", rutaImg)
        miperro.sRutaColeccionMascota=[String(format:"Perros/coleccion/perro%d.jpg",rutaImg)]

        
      
        DataHolder.sharedInstance.insertarPerros(perro: miperro, position: DataHolder.sharedInstance.numPerros!)
        
    }
    
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker.delegate=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imgData = UIImageJPEGRepresentation(img!, 0.5)! as Data
        imgSelfie?.image = img
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
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
