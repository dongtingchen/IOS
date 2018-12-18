//
//  ViewController.swift
//  10-2(transition)
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func butClick(_ sender: Any) {
        let imageView = UIImageView(image: UIImage(named: "image"))
        imageView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        UIView.transition(from: myView, to: imageView, duration: 4, options: .transitionFlipFromRight, completion: nil)
    }
}

