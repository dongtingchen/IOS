//
//  SecondViewController.swift
//  11-1(mvc)
//
//  Created by student on 2018/12/5.
//  Copyright © 2018年 xudongting. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var stu:Student!
    //2
    //var delegate: StudentProtocol?
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNo.text = stu.no
        tfName.text = stu.name
        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        stu.no = tfNo.text!
        stu.name = tfName.text!
        
//2
//      delegate?.change(name: name, no: no)
        //1
//        for vc in self.navigationController!.viewControllers {
//            if let firstVC = vc as? FirstViewController{
//                firstVC.no = no
//                firstVC.name = name
//            }
//        }
        
//      dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
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
