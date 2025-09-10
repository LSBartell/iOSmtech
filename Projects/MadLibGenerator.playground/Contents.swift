import UIKit

func generateMadLib(adjective1 : String, adjective2: String, noun: String, pluralNoun: String, verbEndingInIng: String) -> String{

    var adjectives = [adjective1, adjective2]
    adjectives.shuffle()
    let adj1 = adjectives[0]
    let adj2 = adjectives[1]
    
    if !adjective1.isEmpty && !adjective2.isEmpty && !noun.isEmpty && !pluralNoun.isEmpty && !verbEndingInIng.isEmpty {
        
        let randomStorySelection = Int.random(in: 1...3)
        
            switch randomStorySelection {
        case 1:
                return """
            A vacation is when you take a trip to some \(adj1) place
            with your \(adj2) family. Usually you go to some place
            that is near a/an \(noun).
            When parents go on a vacation, they spend their time eating
            three \(pluralNoun) a day, and fathers play golf, and mothers
            sit around \(verbEndingInIng).
            """
        case 2:
                return """
                My \(adj1) brother has a very \(adj2) personality.
                He cannot complete any task unless he has a/an \(noun) and when 
                \(pluralNoun) are anywhere near him he tends to start \(verbEndingInIng)
                """
        default:
                return """
                Without a \(adj1) diet, the \(adj2) Sloth cannot survive.
                The \(noun) is the natural predator of the \(adj2) Sloth.
                The \(adj2) Sloth tends to begin \(verbEndingInIng) when in the
                prescence of many \(pluralNoun).
                """
        }
    }else{
        return
            "Ivalid Input"
    }
}


let story = generateMadLib(adjective1: "frothy", adjective2: "slimy", noun: "Easter Bunny", pluralNoun: "spiders", verbEndingInIng: "hyperventilating")
print(story)

