//
//  InfoPerro.swift
//  PrimeraEntrega
//
//  Created by Taysir Al-Shareef Pinero on 25/4/17.
//  Copyright © 2017 Taysir Al-Shareef Pinero. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class InfoPerro: UIViewController,UIScrollViewDelegate {
    
     @IBOutlet var imgScroll:UIScrollView!
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgScroll.frame = view.frame
        imageArray=[#imageLiteral(resourceName: "per4"),#imageLiteral(resourceName: "per3"),#imageLiteral(resourceName: "per2"),#imageLiteral(resourceName: "per1")]
        
        for z in 0..<imageArray.count {
            let imageView = UIImageView()
            imageView.image = imageArray[z]
            imageView.contentMode = .scaleAspectFit
              let xPosition = self.view.frame.width * CGFloat(z)
            imageView.frame = CGRect(x: xPosition, y: 0, width: (self.imgScroll?.frame.width)!, height:(self.imgScroll?.frame.height)!)
            imgScroll?.contentSize.width=imageView.frame.width * CGFloat(z+1)
            imgScroll.addSubview(imageView)
        }
    }
    
   
    
     
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
