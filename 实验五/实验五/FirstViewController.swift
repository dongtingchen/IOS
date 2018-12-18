//
//  FirstViewController.swift
//  实验五
//
//  Created by student on 2018/10/27.
//  Copyright © 2018年 2016110447. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        self.title = "first"
        
        let label = UILabel(frame: CGRect(x: 200, y: 80, width: 300, height: 150))
        label.text = "Hello World!"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.center = view.center
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 160, y: 300, width: 80, height: 70))
        button.setTitle("click me", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.purple
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        let imgView = UIImageView(frame: CGRect(x: 10, y: 5, width: 400, height: 300))
        imgView.image = UIImage(named: "img1")
        view.addSubview(imgView)
    }
    @IBAction func buttonClicked(){
        if let label = view.subviews.first as? UILabel{
            label.text = "I am clicked!"
            label.textColor = UIColor.black
            label.backgroundColor = UIColor.red
            present(SecondViewController(), animated: true, completion: nil)
        }
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
