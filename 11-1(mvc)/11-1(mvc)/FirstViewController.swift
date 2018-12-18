//
//  ViewController.swift
//  11-1(mvc)
//
//  Created by student on 2018/12/5.
//  Copyright © 2018年 xudongting. All rights reserved.
//

import UIKit
//2
//protocol StudentProtocol {
//    func change(name:String,no:String)
//}
class FirstViewController: UIViewController {

    var stu = Student()
    
//2
//    func change(name: String, no: String) {
//        self.name = name
//        self.no = no
//    }
    

//    var name = ""
//    var no = ""
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        tfNo.text = stu.no
        tfName.text = stu.name
    }
    @IBAction func showSecondVc(_ sender: Any) {
        stu.no = tfNo.text!
        stu.name = tfName.text!
        
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        secVC.stu = stu
//2
//      secVC.delegate = self
        
//      self.present(secVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    @IBAction func showThirdVC(_ sender: Any) {
        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
        self.present(thirdVC, animated: true, completion: nil)
    }
}

