import UIKit
import Foundation


class GymMember {
    var name: String
    var gymID: Int
    var signedIn: Bool = false
    
    init(name: String, gymID: Int) {
        self.name = name
        self.gymID = gymID
    }
}

protocol GymMemberCheckInStore {
    func CheckIdSignIn(_ gymMember: GymMember)
    func saveCheckInAttendance(_ gymMember: GymMember)
}

class GymMemberCheckIn: GymMemberCheckInStore {
    func CheckIdSignIn(_ gymMember: GymMember) {
        // check is member id an active id and signedIn to true if true
    }
    
    func saveCheckInAttendance(_ gymMember: GymMember) {
        //check if member is signed in and add attendace to database if true
    }
}

protocol Workout {
    func burnCalories() -> Int
}


class CaloriesBurnedCalculator {
    var workouts: [Workout]
    
    init(workouts: [Workout]) {
        self.workouts = workouts
    }
    
    func totalCaloriesBurned() -> Int {
        var totalBurned = 0
        for workout in workouts {
            totalBurned += workout.burnCalories()
        }
        return totalBurned
    }
}

class BenchPress: Workout {
    var weight: Int
    var repetitions: Int
    
    init(weight: Int, repetitions: Int) {
        self.weight = weight
        self.repetitions = repetitions
    }
    
    func burnCalories() -> Int {
        Int(Double(weight / 100) * Double(repetitions))
    }
}

class TreadmillRun: Workout {
    var time: Double
    var distance: Double
    
    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }
    
    func burnCalories() -> Int {
        Int((distance * time) / 120)
    }
}

class GoldMember: GymMember {
    var personalTrainerName: String
    
    init(name: String, gymID: Int, personalTrainerName: String) {
        self.personalTrainerName = personalTrainerName
        super.init(name: name, gymID: gymID)
    }
}
