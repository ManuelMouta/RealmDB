//
//  Person.swift
//  RealDB
//
//  Created by Manuel Mouta on 08/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation
import RealmSwift

class Person : Object{
    dynamic var name    : String = ""
    dynamic var surname : String = ""

    static func createPerson(name:String,surname:String) -> Person{
        
        let person      = Person()
        person.name     = name
        person.surname  = surname
        
        return person
    }
}
