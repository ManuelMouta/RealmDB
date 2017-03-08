//
//  DataBaseManager.swift
//  RealDB
//
//  Created by Manuel Mouta on 08/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation
import RealmSwift

struct DataBaseManager{
    
    func addPersonToDb(person : Person,completion:@escaping (Bool)->(Void)){
        
        do {
            let realm = try Realm()
            try! realm.write {
                realm.add(person)
                completion(true)
            }
        } catch let error as NSError {
            //handle error
            completion(false)
        }

        
    }
}
