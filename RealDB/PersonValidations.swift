//
//  InputValidations.swift
//  RealmDB
//
//  Created by Manuel Mouta on 09/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation

struct PersonValidations{
    
    static func validatePerson(name : String, surname : String) -> Bool {
        if(validateInputTxt(value: name) || validateInputTxt(value: surname)){
            return true
        }else{
            return false
        }
    }
    
    static func validateInputTxt (value : String?) -> Bool{
        if(value != nil || value != ""){
            return true
        }else{
            return false
        }
    }
}
