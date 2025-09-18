enum KeyPadNumber: String {
    case n1 = "1", n2 = "2", n3 = "3", n4 = "4", n5 = "5", n6 = "6", n7 = "7", n8 = "8", n9 = "9", nPoint = ".", n0 = "0"
}

enum Operator: String {
    case add = "+", subtract = "-", multiply = "*", divide = "/"
}

struct Calculator {
    var total = 0.0
    var inputNumber = "0"
    var inputNumberPercent = false
    var runningNumber = ""
    var runningNumberPercent = false
    var currentOperator: Operator?
    var equalsFromOperator = false
    var fromOperator = ""
    
    func display() {
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
    
    // defaults as 0
    // when add . dont remove 0
    // cannot add multiple decimal points
    // cannot add multiple 0s to 0
    // removes 0 when no decimal point and number is input
    mutating func numberButton(_ input: KeyPadNumber) {
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
    
    mutating func operatorButton(_ input: Operator) {
        guard currentOperator == nil else {
            if inputNumber == "0" {
                currentOperator = input
                return
            } else {
                fromOperator = input.rawValue
                equalsFromOperator = true
                equalsButton()
                currentOperator = input
                fromOperator = ""
            }
            return
        }
        if runningNumber == "" {
            runningNumber = inputNumber
        }
        inputNumber = "0"
        currentOperator = input
        if inputNumberPercent {
            runningNumberPercent = true
            inputNumberPercent = false
        }
        
        display()
    }
    
    mutating func equalsButton() {
        if let runningNumber = Double(runningNumber), let inputNumber = Double(inputNumber) {
            switch currentOperator {
            case .add:
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
        } else if let inputNumber = Double(inputNumber) {
            switch currentOperator {
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
            case nil:
                if inputNumberPercent {
                    total = inputNumber / 100
                } else {
                    total = inputNumber
                }
            }
        }
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
        guard pressType == .press else {
            inputNumber = "0"
            runningNumber = ""
            inputNumberPercent = false
            runningNumberPercent = false
            total = 0.0
            print(inputNumber)
            return
        }
        if inputNumber != "0" {
            if inputNumberPercent {
                inputNumberPercent = false
            } else {
                inputNumber.removeLast()
                if inputNumber.isEmpty { inputNumber = "0"}
            }
        } else if inputNumber == "0" && currentOperator != nil {
            currentOperator = nil
        } else if inputNumber == "0" && currentOperator == nil && !runningNumber.isEmpty {
            runningNumber.removeLast()
        } else {
            inputNumber = "0"
            runningNumber = ""
            inputNumberPercent = false
            runningNumberPercent = false
            total = 0.0
        }
        
        display()
    }
    // dont allow -0
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




