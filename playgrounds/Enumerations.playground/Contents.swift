import UIKit

// Enums

// We can use enums to group related values into a single type
enum Months {
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

enum Days {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

enum CardinalPoints {
    case north
    case south
    case west
    case east
}

// Declaring a variable of a enum
var currentMonth: Months = .february
var currentDay: Days = .thursday
// How to compare using a enum value
if currentMonth == .february {
    print("It's February!")
} else if currentMonth == Months.december { // It is the same as we would not include the enum type before the value
    print("It's December")
}

func currentDayInString(day: Days) -> String {
    switch day {
    case .monday:
        return "Monday"
    case .tuesday:
        return "Tuesday"
    case .wednesday:
        return "Wednesday"
    case .thursday:
        return "Thursday"
    case .friday:
        return "Friday"
    case .saturday:
        return "Saturday"
    case.sunday:
        return "Sunday"
    }
}


func isWeekDay(day: Days) -> Bool {
    switch day {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        return true
    default:
        return false
    }
}

enum TypeOfDay {
    case WeekDay
    case WeekendDay
}

func getTypeOf(day: Days) -> TypeOfDay {
    switch day {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        return .WeekDay
    default:
        return .WeekendDay
    }
}

// Enums with raw values
// Color with hex value associated

enum Colors: Int {
    case red = 0xFF0000
    case blue = 0x0000FF
    case green = 0x00FF00
}

var mainColor: Colors = .red
print(mainColor.rawValue)

// We can initialize a enum case from the raw value
// But it will initialize an optional variable
var red: Colors? = Colors(rawValue: 0xFF0000)


// Enums with associated values
// We can hold a value alongside a case value

// On this enum Shape, the cases will hold the values
// neccesary to calculate their area
enum Shape {
    case circle(radius: Double)
    case square(size: Double)
    case rectangle(base: Double, height: Double)
}

var aCircle: Shape = .circle(radius: 10)

func calculateAreaOf(shape: Shape) -> Double {
    switch shape {
    case .circle(radius: let radius):
        // Inside the parentesis, we declare a variable that will get the associated value for later use
        return Double.pi * radius
    case .rectangle(let base, let height):
        // We can not include the labels of the associated values, like base: or height:
        return base * height / 2
    case .square(let size):
        return size * size
    }
}

// We can declare functions inside the enum
// and also computed values

enum ProgrammingLanguages {
    case swift
    case objectiveC
    case javascript
    case kotlin
    
    func obtainName() -> String {
        switch self {
        case .swift: return "Swift"
        case .objectiveC: return "Objective-C"
        case .javascript: return "Javascript"
        case .kotlin: return "Kotlin"
        }
    }
}

var aLanguage: ProgrammingLanguages = .swift
print(aLanguage.obtainName())

//Nested types

enum DayNested {
    
    case weekDay(WeekDay)
    case weekendDay(WeekendDay)
    
    enum WeekDay {
        case monday, tuesday, wednesday, thursday, friday
    }
    enum WeekendDay {
        case saturday, monday
    }
}

var dayNested: DayNested = .weekDay(.monday)
