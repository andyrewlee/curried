//: Playground - noun: a place where people can play

import UIKit

// this function takes in two arguments
func splashBrothers(name1: String, name2: String) -> String {
    // the first argument is stored in a constant called name1
    // the second argument is stored in a constant called name2
    return "\(name1) \(name2)"
}

splashBrothers("Splash", "Brothers")

// a curried function is a design pattern where we have a series of nested functions
// that take in one argument at a time. we nest functions until all arguments are exhausted
// our previous function took in two arguments, therefore we need one outer function and one inner

func stephenCurry(name1: String) -> (String) -> String {
    
    func klayThompson(name2: String) -> String {
        return "\(name1) \(name2)"
    }
    
    return klayThompson
}

var klay = stephenCurry("Splash")
klay("Brothers")

// a mutating function is just a curried function
struct Baller {
    var name = "Stephen Curry"
    
    // we have to specify this function as mutating because it is changing the value of a Value Type
    // what does this mutating word do?
    mutating func changeName(newName: String) {
        name = newName
    }
}

// what do you mean it is just a curried function?
var steph = Baller()
// if we option click on the variable we see that we have a function that takes in one argument
// which would be the memory address of the instance of Person because it specifies inout
var curriedFunction = Baller.changeName
// so let's pass in the memory address of steph
// now when we option click on thompson we see that it is a function that takes in one argument of String
// and doesn't return anything
var thompson = curriedFunction(&steph)
thompson("Klay Thompson")
// and we see that we changed the name of the instance of Baller because we went to the memory address location
println(steph.name)