//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by tetsuya nomata on 2019/10/21.
//  Copyright © 2019 tetsuya nomata. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var zoomView : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       imageView.image = zoomView
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
