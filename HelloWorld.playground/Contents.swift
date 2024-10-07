//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Die"
let str2 = "This cannot be changed."
var number = 1
var number2: Double = 2.00
var string = "Hi"
func function() {
    number2 = 2.10
    string = "Die"
}
function()

struct User {
    var name = String()
    var age = Int()
    var favoriteanimal = String()
}

var user = User()
user.name = "Jeffrey"
user.age = 50
user.favoriteanimal = "Duck"
print(user)

class Duck: User {
    
}
