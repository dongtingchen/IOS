//
//  Teacher.swift
//  8(TableView)
//
//  Created by student on 2018/11/29.
//  Copyright © 2018年 xudongting. All rights reserved.
//

import Foundation
class Teacher:Person {
    var title:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age , gender: gender)
    }
    override var description: String{
        return "Name\(fullName) Age\(age) Gender\(gender) Title\(title)"
    }
}
