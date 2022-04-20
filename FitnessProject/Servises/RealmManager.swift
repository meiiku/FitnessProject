//
//  RealmManager.swift
//  FitnessProject
//
//  Created by Fedor on 15.04.2022.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    // Open the local-only default realm
    let localRealm = try! Realm()
    
    func saveWorkoutModel(model: WorkoutModel) {
        
        // add task
        try! localRealm.write {
            localRealm.add(model)
        }
    }
}

