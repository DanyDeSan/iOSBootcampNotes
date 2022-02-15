import UIKit

// Closures

// Closures are basically functions that we can ocupy as variables

// That is how we declare a simple closure that doesnt receive and doesn return
var aClosure: () -> () = {
    print("I'm a Closure")
}

// And we can invoke it like a normal function
aClosure()

// Here we declare a closure that gets an input
var aClosureWithParams: (Int) -> () = { inputInt in
    print(inputInt)
}

aClosureWithParams(2)


// Here we declare a closure that returns a value
var aClosureWithReturn: () -> Int = {
    return 1
}

aClosureWithReturn()


// Closures can also be declared as follows

var aClosure2: () -> Void = {
    print("Another closure without input and outputs")
}

aClosure2()

// Closures are a considered a type in swift, so we can declare a closure that can be an optional

var anOptionalClosure: ((Int) -> Int)? = { input in
    return input
}


// The way to call an optional closure would be
anOptionalClosure?(2)


"""
    Closures can a be a block of code that we can passthroug
    in order to be executed when needed to
"""

// Here we can pass a closure to a function, so the function calls it when needed
func doSomething(onCompletion: (Int)->Void) {
    print("Doing stuff")
    onCompletion(1)
}

// Whe passing a function we can do the following syntax
doSomething { input in
    print(input)
}

// or

doSomething(onCompletion: { input in
    print(input)
})



