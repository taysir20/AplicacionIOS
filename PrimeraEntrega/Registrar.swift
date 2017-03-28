//
//  Registrar.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 21/3/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit

class Registrar: UIViewController {
    @IBOutlet var usuario: UITextField?
    @IBOutlet var pass: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        DataHolder.sharedInstance.miUser=usuario?.text
        DataHolder.sharedInstance.miPass=pass?.text
        self.performSegue(withIdentifier: "registro", sender: self)
    }



}
