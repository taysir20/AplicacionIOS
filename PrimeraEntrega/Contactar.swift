//
//  Contactar.swift
//  PrimeraEntrega
//
//  Created by TAYSIR AL-SHAREEF PINERO on 8/6/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import MessageUI

class Contactar: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var btnSend: UIButton!
    
    @IBOutlet weak var btnLlamar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enviarMensaje(_ sender: Any) {
         let perroi:Perro=DataHolder.sharedInstance.arPerros![DataHolder.sharedInstance.indexPerro!]
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = self
        mailCompose.setToRecipients([perroi.sEmail!])
        mailCompose.setSubject("Hola!")
        mailCompose.setMessageBody("Estimado/a" + perroi.sCuidador!, isHTML: false)
        if(MFMailComposeViewController.canSendMail()){
            self.present(mailCompose, animated:true, completion: nil)
        }else{
            print("Falló el envío!!!")
        }
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func llamar(_ sender: Any) {
          let perroi:Perro=DataHolder.sharedInstance.arPerros![DataHolder.sharedInstance.indexPerro!]
        let url: NSURL = URL(string: "TEL://" + perroi.sTelefono!)! as URL as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
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
