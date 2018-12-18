//
//  ViewController.swift
//  12-2(CoreData)
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 xudongting. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfGender: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    //设置代理,强转为自己的代理对象
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //保留上下文
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: Any) {
        let person = Person(context: context);
        person.name = tfName.text
        person.gender = tfGender.text
        person.age = tfAge.text
        person.phone = tfPhone.text
        appDelegate.saveContext()
    }
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            p.phone = tfPhone.text
            p.gender = tfGender.text
            p.age = tfAge.text
            //修改完成后需要保存
            appDelegate.saveContext()
        }
    }
    @IBAction func dele(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            context.delete(p)
            //删除完成后需要保存
            appDelegate.saveContext()
        }
    }
    @IBAction func sele(_ sender: Any) {
        //先构造一个请求对象
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            tfPhone.text = p.phone
            tfGender.text = p.gender
            tfAge.text = p.age
        }
    }
}

