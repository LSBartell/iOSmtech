//  🏔️ MTECH Code Challenge SF03: "Colors, Numbers, Letters"
//  Concept: Practice using if and switch statements to evaluate variables

//  Instructions:
    //  Under each step below, write the required code.
    //  As you work, change the color, number, and letter constants to see how it changes the outcome of each control flow statement.

//  ⌺ Black Diamond Challenge:
    //  Create and switch statement that will print "That's a color!" for any primary or secondary color, and "I don't know that one." for any other string.
let primaryOrSecondaryColor = "green"

switch primaryOrSecondaryColor {
case "red", "blue", "yellow", "green", "purple", "orange":
    print("That's a color!")
default:
    print("I don't know that one.")
}

// Starter code: Change the value of these constants to thoroughly test your code.
let color = "Blue"
let number = 150
let letter = "A"

//  1) Create an if statement that checks to see if the color variable is "blue"
    //  If it is, print "That is my favorite color!"
    //  If the color is not "blue" then print "Cool!"
    //  Only one of the print statments should print when you run your code. NOT BOTH.
if color.lowercased() == "blue" {
    print("That is my favorite color!")
}else{
        print("Cool!")
        }
//  2) Check to see if the number variable is between 1 and 100.
    //  If it is, print "That is a valid number
    //  If it is not between 1 and 100 print "That is NOT a valid number"
switch number {
case 1...100:
    print("That is a valid number")
default:
    print("That is not a valid number")
}
    

//  3) Create a switch statement to check if letter is a vowel.
    //  If it is, print "letter is a vowel!"
    //  If it is not a vowel then print "letter is a consonant"
switch letter.lowercased() {
case "a","e","i","o","u":
    print("letter is a vowel!")
default:
    print("letter is not a vowel")
}

