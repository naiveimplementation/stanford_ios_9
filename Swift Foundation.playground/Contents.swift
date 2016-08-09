//: Playground - noun: a place where people can play

import UIKit
import Foundation

// Tuples
let x: (String, Int, Double) = ("hello", 23, 1.25)
let (word, number, value) = x
print(word)
print(number)
print(value)

// Range
let array = ["a", "b", "c", "d"]
// inclusive
array[2...3]
// exclusive
array[2..<3]
for i in 1 ... 23 {
    //print(i)
}

// Array methods
let evens = [2, 5, 9, 14, 23, 25, 28, 44].filter({ $0 % 2 == 0 })
let squares = [1, 2, 3, 4, 5].map { $0 * $0 } // note that if a closure is the last argument to a function it does not need to be enclosed in parentheses
let product = [2, 3, 4].reduce(1) { $0 * $1 }

// String
let string = "hello"
var stringarray = string.characters
for s in stringarray {
    //print(s)
}
string.startIndex
string.endIndex
string.hasPrefix("h")
string.hasSuffix("llo")
string.capitalizedString
string.lowercaseString
string.uppercaseString

// Initialization
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
f.temperature



