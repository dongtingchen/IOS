import Cocoa
//1.1
let dictionary = [["name":"张三","age":"18"],["name":"李四","age":"19"],["name":"富尔","age":"21"],["name":"富察","age":"26"]]
let age = dictionary.map {
    $0["age"] ?? ""
}
print(age)
//1.2
let str = ["0","12a","cds","f2","2343"]
let number = str.filter{
    Int($0) != nil
}
print("filter函数选出能被转成Int的字符串：\(number)")
//1.3
let arr = ["This","is","a","apple"]
let arry = arr.reduce("",{$0+$1+","})
print(arry)
//1.4
let integer = [10,2,3,35,67,89,-1]
var inte = integer.reduce((max:Int.min,min:Int.max,sum:0)){
    (inte,i) in return(max(inte.max,i),min(inte.min, i),inte.sum+i)
}
// var max = integer.reduce(integer[0],{$0 > $1 ? $0 : $1})
// var min = integer.reduce(integer[0],{$0 < $1 ? $0 : $1})
// var sum = integer.reduce(integer[0],{$0 + $1})
print("最大值：\(inte.max)")
print("最小值：\(inte.min)")
print("总数和：\(inte.sum)")

//1.6
extension Int{
    func sqrt(num:Int) -> Double{
        return Darwin.sqrt(Double(num))
    }
}
print(sqrt(16))

//1.7
func maxMin<T:Comparable>(data:[T])->(max:T,min:T){
    var max = data[0]
    var min = data[0]
    for i in data{
        if max < i{
            max = i
        }else if min > i{
            min = i
        }
    }
    return (max,min)
}
var inter1 = maxMin(data:[-3,4,53,2,0,3])
print("最大值和最小值为：\(inter1.max) \(inter1.min)")
var inter2 = maxMin(data:[-1.09,-4.8,-56.8,42.6,0.89,4.7,24.54,56.245])
print("最大值和最小值为：\(inter2.max) \(inter2.min)")
var inter3 = maxMin(data:["x","cd","efrf","avdd"])
print("最大值和最小值为：\(inter3.max) \(inter3.min)")

