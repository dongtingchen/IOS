import Cocoa

var Primes = [Int]()
for i in 4...100{
    var prime:Bool = true
    /*var tu = 0*/
    for j in 2..<i{
        if i%j == 0{
            prime = false
            /*tu += 1*/
        }
    }
    if prime == true
        /*if tu == 0*/
    {
        Primes.append(i)
    }
    /*tu = 0*/
    /*prime = false*/
}
print(Primes)
/*升序排列*/
Primes.sort()
print(Primes)
/*第一种降序排列*/
func compare(one:Int,two:Int) -> Bool{
    return two>one
}
Primes.sort(by:compare)
print("第一种降序排列")
print(Primes)
/*第二种降序排列*/
Primes.sort(by:{
    (one:Int,two:Int) -> Bool in
    return two<one
})
print("第二种降序排列")
print(Primes)
/*第三种降序排列*/
Primes.sort{
    (one,two) -> Bool in
    return two<one
}
print("第三种降序排列")
print(Primes)
/*第四种降序排列*/
Primes.sort{(one,two) in
    return two<one
}
print("第四种降序排列")
print(Primes)
/*第五种降序排列*/
Primes.sort(by:>)
print("第五种降序排列")
print(Primes)
/*第六种降序排列*/
Primes.sort{$0>$1}
print("第六种降序排列")
print(Primes)
