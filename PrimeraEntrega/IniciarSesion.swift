//
//  ViewController.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 21/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import FirebaseAuth

class IniciarSesion: UIViewController {
    
    @IBOutlet var txtfUsuario: UITextField?
    @IBOutlet var txtfPass: UITextField?
    @IBOutlet var txtVConsola: UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnLogin() {
        
       //if txtfUsuario?.text=="taysir" && txtfPass?.text=="1234"{
           //self.performSegue(withIdentifier: "logueo", sender: self)
        //}else{
          // txtVConsola?.text=String(format: "Usuario o contraseña incorrectos ",(txtfUsuario?.text)!,(txtfPass?.text)!)
       //}
        
        /*if (txtfUsuario?.text?.isEqual(DataHolder.sharedInstance.miUser))! && ((txtfPass?.text)?.isEqual(DataHolder.sharedInstance.miPass))!{
            self.performSegue(withIdentifier: "logueo", sender: self)
           
        
        }else{
            txtVConsola?.text=String(format: "Usuario o contraseña incorrectos ",(txtfUsuario?.text)!,(txtfPass?.text)!)
             }
        */
        FIRAuth.auth()?.signIn(withEmail: (txtfUsuario?.text)!, password: (txtfPass?.text)!) {(user,error) in
            
            if(error==nil){
                self.performSegue(withIdentifier: "logueo", sender: self)
            }else{
                print("Error en Registro", error!)
                self.txtVConsola?.text=String(format: "Usuario o contraseña incorrectos ",(self.txtfUsuario?.text)!,(self.txtfPass?.text)!)
            }
            }
            
        }

   


}

