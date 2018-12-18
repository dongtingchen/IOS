import Cocoa
//Date
let dateAsString = Date()
let timeZH = DateFormatter()
//设置中文时间
timeZH.locale = Locale(identifier: "zh_CN")
timeZH.dateFormat="yyyy年MMMd日EEEE a HH:mm "
//默认为英国伦敦时间
print(timeZH.string(from: dateAsString))
let calendar = Calendar.current
var components = DateComponents()
components.timeZone = TimeZone(abbreviation:"UTC+9")
//设置时区为东八区，北京时间
var dateComponets1 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*8)!, from: dateAsString)
dateComponets1.timeZone = TimeZone(abbreviation:"UTC+9")
let dateCh = calendar.date(from:dateComponets1)
print(timeZH.string(from: dateCh!))
//设置时区为东九区，东京时间
var dateComponets2 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: 3600*9)!, from: dateAsString)
dateComponets1.timeZone = TimeZone(abbreviation:"UTC+10")
let dateJp = calendar.date(from:dateComponets2)
print(timeZH.string(from: dateJp!))
//设置时区为，纽约时间
var dateComponets3 = calendar.dateComponents(in: TimeZone.init(secondsFromGMT: -3600*5)!, from: dateAsString)
dateComponets1.timeZone = TimeZone(abbreviation:"UTC-5")
let dateAm = calendar.date(from:dateComponets3)
print(timeZH.string(from:dateAm!))


//String
var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
//返回字符串从第6个字符到第20个字符的子串
// str[str.index(str.startIndex, offsetBy: 6)..<str.index(str.startIndex, offsetBy: 20)]
print(str)
var str1 = str.index(str.startIndex, offsetBy: 5)
var str2 = str.index(str.startIndex, offsetBy: 20)
var str3 = str[str1..<str2]
print(str3)
var str4 = str.replacingOccurrences(of:"OS",with:"")
print(str4)

//文件
let dictionary = ["\(time)":"\(str)"] as AnyObject
let fileManager = FileManager.default
if var dictionaryPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
    dictionaryPath.appendPathComponent("test.txt")
    dictionary.write(to: dictionaryPath,atomically: true)
    print(dictionaryPath.path)
}

//URL
//MyError
//guard let weatherUrl = URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html") else{
//    throw MyError.NotURL
//}
//let jsondata = try! Data(contentsOf: weatherUrl)
//let json = try! JSONSerialization.jsonObject(with: jsondata, options: .allowFragments)
//guard let dic = json as? [String:Any] else{
//    throw MyError.NotURL
//}
//guard let weather = dic["weatherinfo"] as? [String:String] else{
//    throw MyError.NotURL
//}

