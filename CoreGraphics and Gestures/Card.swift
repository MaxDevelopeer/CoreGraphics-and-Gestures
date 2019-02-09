//
//  Card.swift
//  CoreGraphics and Gestures
//
//  Created by Maxim on 09/02/2019.
//  Copyright © 2019 Maxim. All rights reserved.
//

import Foundation

struct Card: CustomStringConvertible {
    var description: String {
        return "\(colour) \(number) "
    }
    
    
    var colour: Colour
    var number: Int
    
//    static var allNumbers: [Int] {
//        get {
//            var all = [Int]()
//            for i in 0...9 {
//                all.append(i)
//            }
//            return all
//        }
//    }
    
    enum Colour {
        case green
        case yellow
        case red
        case blue
    static var all = [Colour.green, .yellow, .red, .blue]
    }
    
//    enum Number {
//        case number (Int)
//
//        var order: Int? {
//            switch self {
//            case .number(let num): return num
//            default: return nil
//            }
//        }
//        static var all: [Number] {
//            var allNumber: [Number]
//            for i in 0...9 {
//                allNumber.append(Card.Number.number(i))
//            }
//            return allNumber
//        }
//    }
    
    
    
}
