//
//  RegistroPerro.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 25/5/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit

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
    
    
    @IBAction func enviarDatosNuevoPerro(_ sender: Any) {
        let miperro = Perro()
        
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
