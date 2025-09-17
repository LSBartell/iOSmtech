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
    
    mutating func display() {
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
            }
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
        if inputNumberPercent {
            print(inputNumber,"%")
        } else {
            print(inputNumber)
        }
    }
    
    mutating func operatorButton(_ input: Operator) {
        if runningNumber == "" {
            runningNumber = inputNumber
        }
        inputNumber = "0"
        currentOperator = input
        if inputNumberPercent {
            runningNumberPercent = true
            inputNumberPercent = false
        }
        if let currentOperator {
            print(currentOperator.rawValue)
        }
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
        print(total)
        inputNumber = "0"
        runningNumber = ""
        inputNumberPercent = false
        runningNumberPercent = false
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
                inputNumber.remove(at: inputNumber.endIndex)
                if inputNumber.isEmpty { inputNumber = "0"}
            }
        } else if inputNumber == "0" && currentOperator != nil {
            currentOperator = nil
        } else {
            inputNumber.remove(at: inputNumber.endIndex)
        }
        
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
        print(inputNumber)
    }
    
    mutating func percentButton() {
        if inputNumberPercent {
            inputNumberPercent = false
        } else {
            inputNumberPercent = true
        }
        if inputNumberPercent {
            print(inputNumber,"%")
        } else {
            print(inputNumber)
        }
    }
}
var calculator = Calculator()
calculator.numberButton(.n3)
calculator.operatorButton(.add)
calculator.display()
