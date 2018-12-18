import Cocoa

enum Gender:Int{
    case male
    case female
    static func >(lhs:Gender,rhs:Gender) -> Bool{
        return lhs.rawValue>rhs.rawValue
    }
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
class Teacher:Person{
    var title:String
    init(firstname:String,lastname:String,age:Int,gender:Gender,title:String){
        self.title = title
        super.init(firstname:firstname,lastname:lastname,age:age,gender:gender)
    }
    convenience init(name:String){
        self.init(firstname:name,lastname:"",age:18,gender:Gender.female,title:"2016")
    }
    override var description:String{
        return super.description + " " + "title:\(title)"
    }
}
// Student类
class Student:Person{
    var stuNo:String
    init(firstname:String,lastname:String,age:Int,gender:Gender,stuNo:String){
        self.stuNo = stuNo
        super.init(firstname:firstname,lastname:lastname,age:age,gender:gender)
    }
    convenience init(name:String){
        self.init(firstname:name,lastname:"",age:18,gender:Gender.female,stuNo:"201611000")
    }
    override var description:String{
        return super.description + " " + "stuNo:\(stuNo)"
    }
}
//Person实例
var p1 = Person(firstname: "章", lastname: "三", age: 20, gender: Gender.female)
var p2 = Person(firstname: "言", lastname: "妤", age: 20, gender: Gender.male)
var p3 = Person(firstname: "言", lastname: "妤", age: 21, gender: Gender.male)
var p4 = Person(firstname: "章", lastname: "三", age: 20, gender: Gender.female)
//Teacher实例
var t1 = Teacher(firstname:"x",lastname:"dv",age:29,gender:Gender.male,title:"2015")
var t2 = Teacher(firstname:"x",lastname:"fv",age:32,gender:Gender.male,title:"2015")
var t3 = Teacher(firstname:"x",lastname:"rv",age:41,gender:Gender.male,title:"2015")
//Student实例
var s1 = Student(firstname:"dv",lastname:"vs",age:19,gender:Gender.male,stuNo:"201511000")
var s2 = Student(firstname:"vf",lastname:"vs",age:19,gender:Gender.male,stuNo:"201511000")
print(p1.description)
print(p2.description)
print(p3.description)
print(p4.description)
if p1 == p4{
    print("p1==p4")
}else{
    print("p1!=p4")
}
if p3 == p2{
    print("p2==p3")
}else{
    print("p2!=p3")
}
print(t1.description)
print(s1.description)
var primes = [Person]()
primes.append(p1)
primes.append(p2)
primes.append(p3)
primes.append(p4)
primes.append(t1)
primes.append(t2)
primes.append(t3)
primes.append(s1)
primes.append(s2)
print(primes[6].description)
/*分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容*/
var dicitionary = ["Person":0,"Teacher":0,"Student":0]
for arry in primes{
    if arry is Student{
        dicitionary["Person"]!+=1
    }else if arry is Teacher{
        dicitionary["Teacher"]!+=1
    }else{
        dicitionary["Student"]!+=1
    }
}
for(key,value) in dicitionary{
    print("key:\(key)","value:\(value)个")
}
//age、fullName、gender+age；
primes.sort(by:{
    return $0.age>$1.age
})
print("age排序")
for arry in primes{
    print(arry.description)
}
primes.sort(by:{
    return $0.fullname<$1.fullname
})
print("fullname排序")
for arry in primes{
    print(arry.description)
}
primes.sort(by:{
    return ($0.gender.rawValue<$1.gender.rawValue)&&($0.age<$1.age)
})
print("gender+age排序")
for arry in primes{
    print(arry.description)
}
