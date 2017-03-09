//
//  Pet.swift
//  RealmDB
//
//  Created by Manuel Mouta on 09/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation
import RealmSwift

class Pet : Object{
    static let pets = ["Dog","Cat","Bird"]
    dynamic var type    : String = ""
    
    static func createPerson(type:String) -> Pet{
        
        let pet      = Pet()
        pet.type     = type
        
        return pet
    }
}
