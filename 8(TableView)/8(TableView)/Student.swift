//
//  Student.swift
//  8(TableView)
//
//  Created by student on 2018/11/29.
//  Copyright © 2018年 xudongting. All rights reserved.
//

import Foundation

class Student:Person {
    var grade:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,grade:String) {
        self.grade = grade
        super.init(firstName: firstName, lastName: lastName, age: age , gender: gender)
    }
    override var description: String{
        return "Name\(fullName) Age\(age) Gender\(gender) Grade\(grade)"
    }
}
