/*:
## Exercise - Functions and Optionals

 If an app asks for a user's age, it may be because the app requires a user to be over a certain age to use some of the services it provides. Write a function called `checkAge` that takes one parameter of type `String`. The function should try to convert this parameter into an `Int` value and then check if the user is over 18 years old. If he/she is old enough, print "Welcome!", otherwise print "Sorry, but you aren't old enough to use our app." If the `String` parameter cannot be converted into an `Int` value, print "Sorry, something went wrong. Can you please re-enter your age?" Call the function and pass in `userInputAge` below as the single parameter. Then call the function and pass in a string that can be converted to an integer.
 */
let userInputAge: String = "34e"

func checkAge(age : String)-> Int?{
    if let ageInt = Int(age){
        //this means age is an integer
        //if they are 18 or older
        if ageInt >= 18{
            print("welcome!")
        }else{
            print("Sorry, but you are not old enough to use our app")
        }
        return ageInt
    } else {// age is not an interger
        print("Sorry. SOmthing went wrong, please try to enter oyur age again?")
        return nil
    }
}
checkAge(age: userInputAge) // Sorry, wrong input
checkAge(age: "18")         //welcome
checkAge(age: "0")          //fail
//:  Go back and update your function to return the age as an integer. Will your function always return a value? Make sure your return type accurately reflects this. Call the function and print the return value.
 print(checkAge(age: "34"))
if let age = checkAge(age: "56"){
    print(age)
}

//:  Imagine you are creating an app for making purchases. Write a function that will take in the name of an item for purchase as a `String` and will return the cost of that item as an optional `Double`. In the body of the function, check to see if the item is in stock by accessing it in the dictionary `stock`. If it is, return the price of the item by accessing it in the dictionary `prices`. If the item is out of stock, return `nil`. Call the function and pass in a `String` that exists in the dictionaries below. Print the return value.
var prices = ["Chips": 2.99, "Donuts": 1.89, "Juice": 3.99, "Apple": 0.50, "Banana": 0.25, "Broccoli": 0.99]
var stock = ["Chips": 4, "Donuts": 0, "Juice": 12, "Apple": 6, "Banana": 6, "Broccoli": 3]

let price = prices["Chips"]
getPrice(of:"Chips")
func getPrice(of item : String) -> Double?{
    //code here
    if let price = prices[item]{
        print(price)
    }
    return prices[item]
}

/*:
[Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - Food Functions](@next)
 */
