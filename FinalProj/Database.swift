//
//  Database.swift
//  FinalProj
//
//  Created by Predko Brown Marya C. on 4/12/18.
//  Copyright © 2018 Predko Brown Marya C. All rights reserved.
//

import Foundation
import SpriteKit
import FirebaseDatabase


typealias DBResult = ([AnyHashable: Any])-> Void

final class MyDatabase {

    let database: DatabaseReference

    init() {
      database = Database.database().reference()
    }

    func requestStats(for id:String, completion: @escaping DBResult) {
        database.child("highscores").observe(DataEventType.value){
        (snapshot) in print(snapshot.description)
            guard let dictionary = snapshot.value as? NSDictionary, let result = dictionary[id] as? [AnyHashable: Any] else{
                    return
            }
            completion(result)
        }

    }
}

