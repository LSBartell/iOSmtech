//
//  SpaceshipScreen.swift
//  State Spaceship (aka Stateship)
//
//  Created by Jane Madsen on 9/29/25.
//

import SwiftUI

@Observable class ShipComputer {
    var availablePower = 10
    var heading = ""
}

struct SpaceshipScreen: View {
    @State var shipComputer = ShipComputer()
    
    var body: some View {
        Form {
            Section("Helm Station") {
                HelmStation()
            }
            
            Section("Weapons Station") {
                WeaponsStation()
            }
            
            Section("Shield Station") {
                ShieldStation()
            }
            
            Section("Engine Station") {
                EngineStation()
            }
            
            Text("Available Power: \(shipComputer.availablePower)")

        }
        .padding()
        .environment(shipComputer)
    }
}

struct HelmStation: View {
   @Environment(ShipComputer.self) var shipComputer
    @State var inChair: Bool = false
   var body: some View {
       @Bindable var shipComputer = shipComputer
        HStack {
            CrewChair(crewMember: .dog, inChair: $inChair)
            
            TextField("Heading", text: $shipComputer.heading)
                .disabled(!inChair)
        }
    }
}

struct WeaponsStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State var weaponIsOn = false
    @State var weaponPower = 0
    @State var inChair: Bool = false
    var body: some View {
        @Bindable var shipComputer = shipComputer
        HStack {
            CrewChair(crewMember: .cat, inChair: $inChair)
            
            VStack {
                Toggle("Weapons Power: \(weaponPower)", isOn: $weaponIsOn)
                            .onChange(of: weaponIsOn) {
                                if weaponIsOn && shipComputer.availablePower >= 3 {
                                    weaponPower = 3
                                    shipComputer.availablePower -= 3
                                } else {
                                    weaponPower = 0
                                    shipComputer.availablePower += 3

                                }
                            }
                
                Button("Fire!") {
                    if weaponPower == 3 {
                        print("PEW!")
                    } else {
                        print("Weapon unpowered")
                    }
                }
            }
            .disabled(!inChair)
        }
    }
}

struct ShieldStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State var shieldPower = 0
    @State var inChair: Bool = false
    var body: some View {
        @Bindable var shipComputer = shipComputer
        HStack {
            CrewChair(crewMember: .lizard, inChair: $inChair)
            
            Stepper("Shield Power: \(shieldPower)", value: $shieldPower, in: 0...10)
                .onChange(of: shieldPower) { oldValue, newValue in
                    let difference = newValue - oldValue
                    
                    shipComputer.availablePower -= difference
                    
                    if shipComputer.availablePower < 0 {
                        shieldPower = oldValue
                    }
                }
                .disabled(!inChair)
        }
    }
}

struct EngineStation: View {
    @Environment(ShipComputer.self) var shipComputer
    @State var enginePower = 0
    @State var inChair: Bool = false
    var body: some View {
        @Bindable var shipComputer = shipComputer
        HStack {
            CrewChair(crewMember: .hare, inChair: $inChair)
            Stepper("Engine Power: \(enginePower)", value: $enginePower, in: 0...10)
                .onChange(of: enginePower) { oldValue, newValue in
                    let difference = newValue - oldValue
                    
                    shipComputer.availablePower -= difference
                    
                    if shipComputer.availablePower < 0 {
                        enginePower = oldValue
                    }
                }
                .disabled(!inChair)
        }
    }
}

struct CrewChair: View {
    var crewMember: Crew
    @Binding var inChair: Bool
    
    var body: some View {
        Button {
            inChair.toggle()
        } label: {
            if inChair {
                crewMember.icon
            } else {
                Image(systemName: "person.slash")
            }
        }
        .padding(5)
        .background {
            Circle()
                .foregroundStyle(.gray)
        }
    }
}

enum Crew: String {
    case dog
    case cat
    case lizard
    case hare
    
    var icon: Image {
        switch self {
        case .dog:
            Image(systemName: "dog")
        case .cat:
            Image(systemName: "cat")
        case .lizard:
            Image(systemName: "lizard")
        case .hare:
            Image(systemName: "hare")
        }
    }
}

#Preview {
    SpaceshipScreen()
}
