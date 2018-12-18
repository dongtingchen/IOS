import Cocoa

enum Gender:Int{
    case male
    case female
    static func >(lhs:Gender,rhs:Gender) -> Bool{
        return lhs.rawValue>rhs.rawValue
    }
}
//协议SchoolProtocol
enum Department{
    case Teacher
    case Student
}
protocol SchoolProtocol{
    var department:Department{
        get set
    }
    func lendBook()
}
//Person类
class Person{
    var firstname:String
    var lastname:String
    var age:Int
    var gender:Gender
    var fullname:String{
        get{
            return firstname + "" + lastname
        }
    }
    init(firstname:String,lastname:String,age:Int,gender:Gender){
        self.firstname = firstname
        self.lastname = lastname
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){
        self.init(firstname:name,lastname:"",age:18,gender:Gender.male)
    }
    var description:String{
        return "Name:\(fullname) Age:\(age) Gender:\(gender)"
    }
    func run() {
        print("Person \(self.fullname) is running")
    }
}
func ==(lhs:Person, rhs:Person) -> Bool{
    return lhs.fullname == rhs.fullname && lhs.age == rhs.age && lhs.gender == rhs.gender
}
func !=(lhs:Person, rhs:Person) -> Bool{
    if lhs.fullname != rhs.fullname || lhs.age != rhs.age || lhs.gender != rhs.gender{
        return true
    }
    return false
}
//Teacher类
class Teacher:Person,SchoolProtocol{
    var title:String
    var department:Department
    init(firstname:String,lastname:String,age:Int,gender:Gender,title:String){
        self.title = title
        self.department = Department.Teacher
        super.init(firstname:firstname,lastname:lastname,age:age,gender:gender)
    }
    convenience init(name:String){
        self.init(firstname:name,lastname:"",age:18,gender:Gender.female,title:"2016")
    }
    override var description:String{
        return super.description + " " + "title:\(title)"
    }
    override func run(){
        print("Teacher \(self.fullname) is running")
    }
    func lendBook(){
        print("Teacher \(self.fullname) lendBook")
    }
}
// Student类
class Student:Person,SchoolProtocol{
    var stuNo:String
    var department:Department
    init(firstname:String,lastname:String,age:Int,gender:Gender,stuNo:String){
        self.stuNo = stuNo
        self.department = Department.Student
        super.init(firstname:firstname,lastname:lastname,age:age,gender:gender)
    }
    convenience init(name:String){
        self.init(firstname:name,lastname:"",age:18,gender:Gender.female,stuNo:"201611000")
    }
    override var description:String{
        return super.description + " " + "stuNo:\(stuNo)"
    }
    override func run(){
        print("Student \(self.fullname) is running")
    }
    func lendBook(){
        print("Student \(self.fullname) lendBook")
    }
}
let p1 = Person(firstname: "章", lastname: "三", age: 20, gender: Gender.female)
let t1 = Teacher(firstname:"x",lastname:"dv",age:29,gender:Gender.male,title:"2015")
let s1 = Student(firstname:"dv",lastname:"vs",age:19,gender:Gender.male,stuNo:"201511000")
p1.run()
t1.run()
s1.run()
t1.lendBook()
s1.lendBook()
