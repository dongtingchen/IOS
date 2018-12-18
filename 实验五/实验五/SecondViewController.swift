//
//  SecondViewController.swift
//  实验五
//
//  Created by student on 2018/10/27.
//  Copyright © 2018年 2016110447. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        self.title = "second"
        
        let imgView = UIImageView(frame: CGRect(x: 10, y: 550, width: 400, height: 300))
        imgView.image = UIImage(named: "img2")
        view.addSubview(imgView)
        
        let button = UIButton(frame: CGRect(x: 160, y: 330, width: 80, height: 70))
        button.setTitle("target", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.purple
        view.addSubview(button)
        
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
