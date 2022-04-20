//
//  WorkoutModel.swift
//  FitnessProject
//
//  Created by Fedor on 15.04.2022.
//

import RealmSwift

class WorkoutModel: Object {
    
    @Persisted var workoutName: String = "Unknown"
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutIsRepeat: Bool = false
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workoutImage: Data?
    @Persisted var workoutStatus: Bool = false
}
