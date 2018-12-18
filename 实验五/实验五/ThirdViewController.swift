//
//  ThirdViewController.swift
//  实验五
//
//  Created by student on 2018/10/27.
//  Copyright © 2018年 2016110447 All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        self.title = "third"
        
        let label = UILabel(frame: CGRect(x: 200, y: 80, width: 300, height: 150))
        label.text = "Weclome!!!"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.center = view.center
        view.addSubview(label)
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
