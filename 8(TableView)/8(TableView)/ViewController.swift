//
//  ViewController.swift
//  8(TableView)
//
//  Created by student on 2018/11/29.
//  Copyright © 2018年 xudongting. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var stuArray = [Student]()
    var teaArray = [Teacher]()
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var studentTableView: UITableView!
    @IBOutlet weak var showLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuArray.count + teaArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < stuArray.count{
            var cell:StudentTableViewCell
            cell = (tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell)
            let stu = stuArray[indexPath.row]
            cell.name.text = stu.fullName
            cell.age.text = "\(stu.age)"
            cell.gender.text = "\(stu.gender)"
            cell.grade.text = "\(stu.grade)"
            cell.pic.image = UIImage(named: "stu")
            return cell
        }else{
            var cell:TeacherTableViewCell
            cell = (tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell)
            let tea = teaArray[indexPath.row - stuArray.count]
            cell.name.text = tea.fullName
            cell.age.text = "\(tea.age)"
            cell.gender.text = "\(tea.gender)"
            cell.title.text = "\(tea.title)"
            cell.pic.image = UIImage(named: "tea")
            return cell
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stuArray.append(Student(firstName:"zhang",lastName:"san",age:18,gender:Gender.female,grade:"89"))
        stuArray.append(Student(firstName:"li",lastName:"si",age:17,gender:Gender.male,grade:"70"))
        stuArray.append(Student(firstName:"wang",lastName:"er",age:19,gender:Gender.female,grade:"97"))
        teaArray.append(Teacher(firstName:"liu",lastName:"lin",age:32,gender:Gender.male,title:"Chinese"))
        teaArray.append(Teacher(firstName:"ai",lastName:"yehuang",age:26,gender:Gender.female,title:"English"))
        teaArray.append(Teacher(firstName:"zhu",lastName:"zhengli",age:28,gender:Gender.male,title:"Math"))
        stuArray.sort {
            return $0.fullName < $1.fullName
        }
        teaArray.sort {
            return $0.fullName < $1.fullName
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < stuArray.count{
            showLabel.text = "you choose :\(stuArray[indexPath.row].fullName)"
        }else{
            showLabel.text = "you choose :\(teaArray[indexPath.row - stuArray.count].fullName)"
        }
        
    }
    //滑动删除功能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if indexPath.row < stuArray.count{
                stuArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }else{
                teaArray.remove(at: indexPath.row-stuArray.count)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //拖动换行功能
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let name = stuArray.remove(at: sourceIndexPath.row)
        stuArray.insert(name, at: destinationIndexPath.row)
    }
    @IBAction func addClicked(_ sender: Any) {
        if let name = nameText.text{
            stuArray.append(Student(firstName:name,lastName:"",age:21,gender:Gender.female,grade:"78"))
            studentTableView.reloadData()
            nameText.resignFirstResponder()
        }
    }
    @IBAction func edit(_ sender: Any) {
        studentTableView.isEditing = !studentTableView.isEditing
    }
}

