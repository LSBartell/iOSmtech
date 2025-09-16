enum KeyPadNumber: String {
    case n1 = "1", n2 = "2", n3 = "3", n4 = "4", n5 = "5", n6 = "6", n7 = "7", n8 = "8", n9 = "9", nPoint = "."
}

enum Operator: String {
    case add = "+", subtract = "-", multiply = "*", divide = "/"
}
var total = 0.0
var inputNumber = ""
var inputNumberPercent = false
var runningNumber = ""
var runningNumberPercent = false
var currentOperator: Operator?

@MainActor func numberButton(_ input: KeyPadNumber) {
    inputNumber.append(input.rawValue)
    if inputNumberPercent {
        print(inputNumber,"%")
    } else {
        print(inputNumber)
    }
}

@MainActor func operatorButton(_ input: Operator) {
    runningNumber = inputNumber
    inputNumber = ""
    currentOperator = input
    if inputNumberPercent {
        runningNumberPercent = true
        inputNumberPercent = false
    }
    if let currentOperator {
        print(currentOperator.rawValue)
    }
}

@MainActor func equalsButton() {
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
    inputNumber = ""
    runningNumber = ""
    inputNumberPercent = false
    runningNumberPercent = false
}

@MainActor func clearButton() {
    total = 0.0
    inputNumber = ""
    runningNumber = ""
    currentOperator = nil
}

@MainActor func negativeOrPositiveButton() {
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

@MainActor func percentButton() {
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


numberButton(.n1)
numberButton(.n5)
operatorButton(.subtract)
negativeOrPositiveButton()
numberButton(.n5)
equalsButton()


