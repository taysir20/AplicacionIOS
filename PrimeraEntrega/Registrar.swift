//
//  Registrar.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 21/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import FirebaseAuth

class Registrar: UIViewController {
    @IBOutlet var pass: UITextField?
    @IBOutlet var email: UITextField?
    @IBOutlet var confirmEmail: UITextField?
    @IBOutlet var confirmPass: UITextField?



    @IBOutlet weak var sgControl: UISegmentedControl!
    @IBOutlet var lblTerms: UILabel!
    
    @IBAction func btnTerms(_ sender: Any) {
        
        terminosCondiciones()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTerms.text = ""
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func terminosCondiciones(){
        
        let terminos = UIAlertController(title: "Términos y condiciones ", message: "Este Acuerdo gobierna su uso de los servicios de Apple ('Servicios') mediante los cuales puede comprar, obtener, licenciar, alquilar o subscribirse (cuando sea posible) a medios, aplicaciones ('Aplicaciones') y otros servicios (en conjunto 'Contenido'). Nuestros Servicios son: iTunes Store, App Store, iBooks Store, Apple Music y Apple News. Nuestros Servicios están disponibles para su uso en su país de residencia ('País de residencia'). Para usar nuestros Servicios, necesita hardware y software compatible (se recomienda tener la última versión y en algunos casos es necesario) y acceso a Internet (podrán aplicarse cargos). El rendimiento de nuestros servicios podrá verse afectado por estos factores.", preferredStyle: .actionSheet)
        
        let btnTerminos = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        
        terminos.addAction(btnTerminos)
        
        present(terminos, animated: true, completion: nil)
        
    }
    
    @IBAction func btnRegistro() {
        
        let controlSegmento = sgControl.selectedSegmentIndex
        
        if(email?.text?.isEqual(confirmEmail?.text))! && ((pass?.text)?.isEqual(confirmPass?.text))!{
            if (controlSegmento == 0) {
                FIRAuth.auth()?.createUser(withEmail: (email?.text)!, password: (pass?.text)!) {(user,error) in
                    if(error==nil){
                        self.lblTerms.text = "¡Enhorabuena!¡Has sido registrado!"
                        // delay para que se muestre por pantalla que se ha registrado correctamente antes de redirigirse
                        // a la pantalla de "inicio de sesión" de nuevo.
                        let when = DispatchTime.now() + 3
                        DispatchQueue.main.asyncAfter(deadline: when){
                            self.performSegue(withIdentifier: "registro", sender: self)
                        }
                        
                    }else if((self.pass?.text?.characters.count)!<6){
                        self.lblTerms.text = "La contraseña debe de contener al menos 6 caracteres"
                    }else{
                        self.lblTerms.text = "Ya existe un usuario registrado con este nombre"

                    }
                }
            }else if(controlSegmento == 1) {
                    self.lblTerms.text = "Debes aceptar los terminos y condiciones"
                }
        }else if (!(email?.text?.isEqual(confirmEmail?.text))!) && ((pass?.text)?.isEqual(confirmPass?.text))!{
            self.lblTerms.text = "El email no coincide"
        }else{
            self.lblTerms.text = "La contraseña no coincide"
        }

        
        
            /*
            DataHolder.sharedInstance.miUser=usuario?.text
            DataHolder.sharedInstance.miPass=pass?.text
            self.performSegue(withIdentifier: "registro", sender: self)
            */
            
        
        
    


    
            
}
}
