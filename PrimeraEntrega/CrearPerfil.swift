//
//  CrearPerfil.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 8/6/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage
import FirebaseAuth



class CrearPerfil: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var lblSubida: UILabel!
    @IBOutlet weak var imgPerfil: UIImageView!
    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var generoUsuario: UITextField!
    @IBOutlet weak var direccionUsuario: UITextField!
    @IBOutlet weak var municipioUsuario: UITextField!
    @IBOutlet weak var paisUsuario: UITextField!
    var imgData:Data?
    let randNum = arc4random_uniform(1000000000)
    var rutaImg:String!
    let imgPicker = UIImagePickerController()
    let miperro = Perro()
    let databaseRef = FIRDatabase.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
         imgPicker.delegate=self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imgData = UIImageJPEGRepresentation(img!, 0.1)! as Data
        imgPerfil?.image = img
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    
    func RandomInt(min: Int, max: Int) -> Int {
        if max < min { return min }
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    @IBAction func subirImg(_ sender: Any) {
        rutaImg=String(format:"Perros/FotoPerfil/perro%d.jpg", RandomInt(min: 0,max: Int(randNum)))
        let imgRefPerfil = DataHolder.sharedInstance.firStorageRef?.child(rutaImg)
        let uploadTaskPerfil = imgRefPerfil?.put(imgData!, metadata:nil){ (metadata,error)
            in
            guard let metadata = metadata else{
                return
            }
            let downloadURL = metadata.downloadURL
        }
        self.lblSubida.text="Foto subida!"
        
            
        }
    
    @IBAction func enviarDatosNuevoPerro(_ sender: Any) {
        
        let post : [String : Any] = ["Direccion" :  direccionUsuario!.text!
            ,"Foto" : rutaImg, "Genero" : generoUsuario!.text!, "Nombre":  nombreUsuario!.text!, "Pais" : paisUsuario!.text!, "Provincia" : municipioUsuario!.text!]
        databaseRef.child("Profile").child((DataHolder.sharedInstance.Usuario?.uid)!).setValue(post)
        self.performSegue(withIdentifier: "entrar", sender: self)

    }
    

        
    }

    
    
