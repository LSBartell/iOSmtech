
 //-First create a delegate protocol with the functions it will use
 protocol ExampleDelegate {
    func someFunction()
    func someOtherFunction()
 }
 // Next create a delegator class which will tell delegate classes what to do, give it a property of protocols type, you can give it functions to tell to the delegate
 class Delegator {
    var delegate: ExampleDelegate?
 
    func makeDelegateDoSomeFunctions() {
        delegate?.someFunction()
        delegate?.someOtherFunction()
    }
 }
 // -Create the delegate class which will listen to the delegator, it must conform to delegate protocol
 class Delegate: ExampleDelegate {
    func someFunction() {
 
    }
    func someOtherFunction() {
 
    }
 }
 //-Last, you must create instances of the delegator and delegate, and assign the instance of delegate to the delegate property of the delegator
 let commander = Delegator()
 let soldier = Delegate()
 commander.delegate = soldier
 
 commander.makeDelegateDoSomeFunctions()
 //-This will make soldier run someFunction() as well as someOtherFunction()

