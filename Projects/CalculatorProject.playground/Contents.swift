enum KeyPadNumber: String {
    case n1 = "1", n2 = "2", n3 = "3", n4 = "4", n5 = "5", n6 = "6", n7 = "7", n8 = "8", n9 = "9", nPoint = ".", n0 = "0"
}

enum Operator: String {
    case add = "+", subtract = "-", multiply = "*", divide = "/"
}

struct Calculator {
    var total = 0.0
    var inputNumber = "0" // number being modified, also the second number in the equation, defaults 0 for starting display
    var inputNumberPercent = false
    var runningNumber = "" // number saved from input number when operator is pressed
    var runningNumberPercent = false
    var currentOperator: Operator? // operator set after button press
    var equalsFromOperator = false // a condition for logic to let sequential operator presses continue the current equation
    var fromOperator = "" // carries operator string value to operator button to equals function for display
    
    // function to display the full current equation to console, called after every button press
    func display() {
        // checks which values in equation exist and only prints those values
        if runningNumber == "" && currentOperator == nil {
            if inputNumberPercent {
                print(inputNumber, "%")
            } else {
                print(inputNumber)
            }
        } else if let currentOperator {
            if inputNumber == "0" {
                if runningNumberPercent {
                    print(runningNumber, "%", " \(currentOperator.rawValue)")
                } else {
                    print(runningNumber, " \(currentOperator.rawValue)")
                }
            } else if runningNumber == "" {
                if inputNumberPercent {
                    print(total, "\(currentOperator.rawValue)", inputNumber, "%")
                } else {
                    print(total, "\(currentOperator.rawValue)", inputNumber)
                }
            } else {
                switch (runningNumberPercent, inputNumberPercent) {
                case (true, true):
                    print(runningNumber, "%", " \(currentOperator.rawValue)", inputNumber, "%")
                case (false, true):
                    print(runningNumber, " \(currentOperator.rawValue)", inputNumber, "%")
                case (true, false):
                    print(runningNumber, "%", " \(currentOperator.rawValue)", inputNumber)
                case (false, false):
                    print(runningNumber, " \(currentOperator.rawValue)", inputNumber)
                }
            }
        } else {
            print(runningNumber)
        }
    }
    
   // function for buttons on the keypad, uses keypad enum to only allow valid inputs
    mutating func numberButton(_ input: KeyPadNumber) {
        // Overwites the default zero with the numbers pressed, and logic to allow proper formating of decimal points, ex: when you add a decimal to zero it is 0.0 not .0
        if inputNumber.contains(".") && input == .nPoint {
            return
        }
        if !inputNumber.contains(".") {
            if inputNumber.first == "0" && input != .nPoint {
                inputNumber.remove(at: inputNumber.startIndex)
            }
        }
        inputNumber.append(input.rawValue)
        
        display()
    }
    // for adding operator to equation
    mutating func operatorButton(_ input: Operator) {
        guard currentOperator == nil else { // if there is not a current operator value continue, else
            if inputNumber == "0" { // change the operator if there is no second number in equation
                currentOperator = input
                return
            } else {                // if there is already an operator and a full equation, it will run the equals function and diplay the total as well as using the total for the running number in your next equation using the operator you pressed, ex: 10 + 5, press pluss again, 15 + (now you can add numbers to continue running the equation)
                fromOperator = input.rawValue
                equalsFromOperator = true
                equalsButton()
                currentOperator = input
                fromOperator = ""
                equalsFromOperator = false
            }
            return
        }
        // if there is no current operator
        if runningNumber == "" { // saves input number to first position in equation
            runningNumber = inputNumber
        }
        inputNumber = "0" // resets the input number
        currentOperator = input // sets the operator in equation
        if inputNumberPercent { // saves if the input number was a percent and resets for next number
            runningNumberPercent = true
            inputNumberPercent = false
        }
        
        display()
    }
    
    mutating func equalsButton() {
        if let runningNumber = Double(runningNumber), let inputNumber = Double(inputNumber) { // if there is a full equation
            // runs the equation based off of the current operator
            switch currentOperator {
            case .add:
                // checks to see which if any numbers are percent then runs the correct math and sets the total
                if runningNumberPercent && inputNumberPercent {
                    total = (runningNumber / 100) + (inputNumber / 100)
                } else if runningNumberPercent && !inputNumberPercent {
                    total = (runningNumber / 100) + inputNumber
                } else if !runningNumberPercent && inputNumberPercent {
                    total = runningNumber + ((runningNumber / 100) * inputNumber)
                } else {
                    total = runningNumber + inputNumber
                }
            case .subtract:
                if runningNumberPercent && inputNumberPercent {
                    total = (runningNumber / 100) - (inputNumber / 100)
                } else if runningNumberPercent && !inputNumberPercent {
                    total = (runningNumber / 100) - inputNumber
                } else if !runningNumberPercent && inputNumberPercent {
                    total = runningNumber - ((runningNumber / 100) * inputNumber)
                } else {
                    total = runningNumber - inputNumber
                }
            case .multiply:
                if runningNumberPercent && inputNumberPercent {
                    total = (runningNumber / 100) * (inputNumber / 100)
                } else if runningNumberPercent && !inputNumberPercent {
                    total = (runningNumber / 100) * inputNumber
                } else if !runningNumberPercent && inputNumberPercent {
                    total = runningNumber * ((runningNumber / 100) * inputNumber)
                } else {
                    total = runningNumber * inputNumber
                }
            case .divide:
                if runningNumberPercent && inputNumberPercent {
                    total = (runningNumber / 100) / (inputNumber / 100)
                } else if runningNumberPercent && !inputNumberPercent {
                    total = (runningNumber / 100) / inputNumber
                } else if !runningNumberPercent && inputNumberPercent {
                    total = runningNumber / ((runningNumber / 100) * inputNumber)
                } else {
                    total = runningNumber / inputNumber
                }
            default:
                total = inputNumber
            }
        } else if let inputNumber = Double(inputNumber) { // if there is only the operator and second number (allows us to run equations using the current total as the first number
            switch currentOperator {
                // checks current operator and if the input number is percent and runs correct math, modifying the total
            case .add:
                if inputNumberPercent {
                    total += ((total / 100) * inputNumber)
                } else {
                    total += inputNumber
                }
            case .subtract:
                if inputNumberPercent {
                    total -= ((total / 100) * inputNumber)
                } else {
                    total -= inputNumber
                }
            case .multiply:
                if inputNumberPercent {
                    total *= ((total / 100) * inputNumber)
                } else {
                    total *= inputNumber
                }
            case .divide:
                if inputNumberPercent {
                    total /= ((total / 100) * inputNumber)
                } else {
                    total /= inputNumber
                }
                // if you press equals without using an operator, it will set total to the input number or run percentage on input if percentage is true
            case nil:
                if inputNumberPercent {
                    total = inputNumber / 100
                } else {
                    total = inputNumber
                }
            }
        }
        // properly formats display based on if it was a full equation or if you starting a new equation using the total
        if equalsFromOperator {
            print(total, fromOperator)
        } else {
            print(total)
        }
        inputNumber = "0"
        runningNumber = ""
        inputNumberPercent = false
        runningNumberPercent = false
        currentOperator = nil
    }
    
    enum DeleteClearPress {
        case press, hold
    }
    //clear once remove one number, hold clear all
    mutating func deleteClearButton(_ pressType: DeleteClearPress) {
        guard pressType == .press else { // if button is held, reset all variables and display a 0
            inputNumber = "0"
            runningNumber = ""
            inputNumberPercent = false
            runningNumberPercent = false
            total = 0.0
            print(inputNumber)
            return
        }
        if inputNumber != "0" { // if button was pressed once and there is a second part of the equation...
            if inputNumberPercent { // if the last spot is % then remove
                inputNumberPercent = false
            } else { // if no percentage then remove last charactor from equation
                inputNumber.removeLast()
                if inputNumber.isEmpty { inputNumber = "0"}
            }
        } else if inputNumber == "0" && currentOperator != nil { // if no second number in equation
            currentOperator = nil // remove operator
        } else if inputNumber == "0" && currentOperator == nil && !runningNumber.isEmpty { // if no second number and no operator
            runningNumber.removeLast() // remove last charactor from first number
        } else { // if equation is empty reset calculator and print 0
            inputNumber = "0"
            runningNumber = ""
            inputNumberPercent = false
            runningNumberPercent = false
            total = 0.0
        }
        
        display()
    }
    // switches current number to negative or back to positive, does not allow -0
    mutating func negativeOrPositiveButton() {
        if let first = inputNumber.first {
            if first != "-" {
                inputNumber.insert("-", at: inputNumber.startIndex)
            } else {
                inputNumber.remove(at: inputNumber.startIndex)
            }
        } else {
            inputNumber.append("-")
        }
        display()
    }
    // changes number to and from a percent type
    mutating func percentButton() {
        if inputNumberPercent {
            inputNumberPercent = false
        } else {
            inputNumberPercent = true
        }
        display()
    }
}
var calculator = Calculator()
calculator.display()
calculator.numberButton(.n5)
calculator.operatorButton(.add)
calculator.numberButton(.n4)
calculator.operatorButton(.subtract)
calculator.numberButton(.n3)
calculator.equalsButton()

calculator.numberButton(.n6)
calculator.operatorButton(.subtract)
calculator.numberButton(.n2)
calculator.equalsButton()
calculator.deleteClearButton(.press)
calculator.deleteClearButton(.press)

calculator.numberButton(.n5)
calculator.percentButton()
calculator.operatorButton(.add)
calculator.numberButton(.n3)
calculator.numberButton(.n0)
calculator.equalsButton()

calculator.numberButton(.n3)
calculator.numberButton(.n0)
calculator.operatorButton(.add)
calculator.numberButton(.n5)
calculator.percentButton()
calculator.equalsButton()

calculator.deleteClearButton(.hold)

calculator.numberButton(.n6)
calculator.numberButton(.n3)
calculator.operatorButton(.multiply)
calculator.numberButton(.n2)
calculator.percentButton()
calculator.deleteClearButton(.press)
calculator.deleteClearButton(.press)
calculator.deleteClearButton(.press)
calculator.deleteClearButton(.press)
calculator.deleteClearButton(.press)
calculator.currentOperator

calculator.numberButton(.n2)
calculator.negativeOrPositiveButton()
calculator.operatorButton(.multiply)
calculator.numberButton(.n5)
calculator.equalsButton()
calculator.deleteClearButton(.hold)

calculator.numberButton(.nPoint)
calculator.numberButton(.n0)
calculator.numberButton(.n5)
calculator.operatorButton(.add)
calculator.numberButton(.n3)
calculator.operatorButton(.subtract)
calculator.numberButton(.n1)
calculator.equalsButton()




