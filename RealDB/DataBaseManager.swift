//
//  DataBaseManager.swift
//  RealDB
//
//  Created by Manuel Mouta on 08/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

struct DataBaseManager{
    
    static func addPersonToDb(name : UITextField,surname : UITextField, completion:@escaping (Bool,String?)->(Void)){
        
        let name    : String = name.text!
        let surname : String = surname.text!
        
        if(PersonValidations.validatePerson(name: name, surname: surname)){
            
            let person = Person.createPerson(name: name, surname: surname)
            
            do {
                let realm = try Realm()
                try! realm.write {
                    realm.add(person)
                    completion(true, nil)
                }
            } catch let error as NSError {
                //handle error
            }
        }
        else{
            completion(false,"You must fill Name and Surname fields")
        }
    }
    
    static func syncPersonsList(){

        do {
            let realm   = try! Realm()
            let results = realm.objects(Person.self)
            print(results)
            ViewController.listOfPersons = results

        } catch let error as NSError {
            //handle error
        }
    }
    
    static func getPersonsList() -> AnyObject?{
        do {
            let realm   = try! Realm()
            let results = realm.objects(Person.self)
            
            return results
        } catch let error as NSError {
            //Handle error
            return nil
        }
    }
    
    
    
}
