import Foundation
import SwiftUI

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var greeting = "Hello, playground"
print(greeting)

struct Pokemon: Codable {
    let name: String
    let types: [String]
    let abilities: [String]
    let moves: [Moves]
    
    enum CodingKeys: String, CodingKey {
        case name // = "whatMyNameActuallyIsInTheAPI"
        case abilities
        case moves
        case types
    }
    
    enum AbilitiesCodingKeys: String, CodingKey {
        case ability
    }
    
    enum AbilityCodingKeys: String, CodingKey {
        case name
    }
    
    enum TypesCodingKeys: String, CodingKey {
        case type
    }
    
    enum TypeCodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        var typesUnkeyedContainer = try container.nestedUnkeyedContainer(forKey: .types)
        
        // decode "types"
        var types = [String]()
        while !typesUnkeyedContainer.isAtEnd {
            let typesContainer = try typesUnkeyedContainer.nestedContainer(keyedBy: TypesCodingKeys.self)
            let typeContainer = try typesContainer.nestedContainer(keyedBy: TypeCodingKeys.self, forKey: .type)
            let type = try typeContainer.decode(String.self, forKey: .name)
            types.append(type)
        }
        self.types = types
        
        // decode "abilities"
        var abilities = [String]()
        var abilitiesContainer = try container.nestedUnkeyedContainer(forKey: .abilities)
        while !abilitiesContainer.isAtEnd {
            let abilityContainer = try abilitiesContainer.nestedContainer(keyedBy: AbilitiesCodingKeys.self)
            let abilityDetailContainer = try abilityContainer.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
            let ability = try abilityDetailContainer.decode(String.self, forKey: .name)
            abilities.append(ability)
        }
        self.abilities = abilities
        
        self.moves = try container.decode([Moves].self, forKey: .moves)
    }
    
    // Encoder Implementation. This was not discussed in class but will need to be implmeneted for Codable conformance (which includes both Decodable and Encodable)
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        
        var typesContainer = container.nestedUnkeyedContainer(forKey: .types)
        for typeName in types {
            var typeWrapper = typesContainer.nestedContainer(keyedBy: TypesCodingKeys.self)
            var typeNameContainer = typeWrapper.nestedContainer(keyedBy: TypeCodingKeys.self, forKey: .type)
            try typeNameContainer.encode(typeName, forKey: .name)
        }
        
        var abilitiesContainer = container.nestedUnkeyedContainer(forKey: .abilities)
        for abilityName in abilities {
            var abilityWrapper = abilitiesContainer.nestedContainer(keyedBy: AbilitiesCodingKeys.self)
            var abilityNameContainer = abilityWrapper.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
            try abilityNameContainer.encode(abilityName, forKey: .name)
        }
        
        try container.encode(moves, forKey: .moves)
    }
        
}

// structured in the same way as the JSON from the PokeAPI
// because we did this you access the move name like this:
// pokemon.moves[0].move.name
struct Moves: Codable {
    let move: Move
}

struct Move: Codable {
    let name: String
}

let url = URL(string: "https://pokeapi.co/api/v2/pokemon/1")!


class PokemonFetcher: Observable {
    var pokemon: Pokemon?
    
    func fetchPokemon() async {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // check the response status code
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Error: HTTP status code \(httpResponse.statusCode)")
            } else {
                // Happy path
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode(Pokemon.self, from: data)
                self.pokemon = pokemon
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}

// example for putting this in a SwiftUI view, with a task to load the pokemon
struct MyView: View {
    @State var pokemonFetcher: PokemonFetcher = PokemonFetcher()
    
    var body: some View {
        VStack {
            if pokemonFetcher.pokemon != nil {
                Text("The pokemon is \(pokemonFetcher.pokemon!.name)")
            } else {
                Text("Loading...")
                    .task {
//                        await pokemonFetcher.fetchPokemon()
                        print("Task done")
                    }
            }
        }
    }
    
}

