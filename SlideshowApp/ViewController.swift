//
//  ViewController.swift
//  SlideshowApp
//
//  Created by tetsuya nomata on 2019/10/20.
//  Copyright © 2019 tetsuya nomata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    
    
    var timer: Timer!
    var imageIndex = 0
    let images = [UIImage(named: "cat1.jpeg"),UIImage(named: "cat2.jpeg"),UIImage(named: "cat3.jpeg")]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
       imageView.image = images[0]
       
        }
   
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        imageView.image = images[imageIndex]
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    
    
    @IBAction func startStop(_ sender: Any) {
        if timer == nil {
       timer = Timer.scheduledTimer(timeInterval: 2, target:self,selector: #selector(onTimer(_:)),userInfo: nil,repeats: true)
        
            startStopButton.setTitle("一時停止", for: .normal)
            backButton.isEnabled = false
            nextButton.isEnabled = false
        }
        else {
        if timer.isValid == true {
                timer.invalidate()
                startStopButton.setTitle("再生", for: .normal)
                backButton.isEnabled = true
                nextButton.isEnabled = true
        } else {
         timer = Timer.scheduledTimer(timeInterval: 2, target:self,selector: #selector(onTimer(_:)),userInfo: nil,repeats: true)
            startStopButton.setTitle("一時停止", for: .normal)
            backButton.isEnabled = false
            nextButton.isEnabled = false
            
            }
        }
    }
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        imageView.image = images[imageIndex]
    }
    
    @IBAction func tapImage(_ sender: Any) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.zoomView = imageView.image!
        
        timer?.invalidate()

        startStopButton.setTitle("再生", for: .normal)
        backButton.isEnabled = true
        nextButton.isEnabled = true
    }
    
@IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
