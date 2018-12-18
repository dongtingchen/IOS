//
//  Card.swift
//  7(Concentration)
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 student. All rights reserved.
//

import Foundation

struct Card {
    private(set) var isSeen = false
    
    var isFaceUp = false{
        didSet {
            if oldValue && !isFaceUp {
                isSeen = true
            }
        }
    }
    
    var isMatched = false
    var identifier: Int
    
    static var idntifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        idntifierFactory += 1
        return idntifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
