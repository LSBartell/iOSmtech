enum KeyPadNumber: String {
    case n1 = "1", n2 = "2", n3 = "3", n4 = "4", n5 = "5", n6 = "6", n7 = "7", n8 = "8", n9 = "9", nPoint = "."
}

enum Operator {
    case add, subtract, multiply, divide
}
var total = 0.0
var inputNumber = ""
var runningNumber = ""
var currentOperator: Operator?
@MainActor func numberButton(_ input: KeyPadNumber) {
    inputNumber.append(input.rawValue)
}

@MainActor func operatorButton(_ input: Operator) {
    runningNumber = inputNumber
    inputNumber = ""
    currentOperator = input
}

@MainActor func equalsButton() {
    if let runningNumber = Double(runningNumber), let inputNumber = Double(inputNumber) {
        switch currentOperator {
        case .add:
            total = runningNumber + inputNumber
        case .subtract:
            total = runningNumber - inputNumber
        case .multiply:
            total = runningNumber * inputNumber
        case .divide:
            total = runningNumber / inputNumber
        default:
            total = inputNumber
        }
    } else if let runningNumber = Double(runningNumber) {
        
    } else {
        
    }
}
