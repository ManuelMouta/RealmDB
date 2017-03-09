//
//  UIAlerts.swift
//  RealmDB
//
//  Created by Manuel Mouta on 09/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation
import UIKit

struct UIAlerts{
    
    static func showUserUpdatedAlert(vc : UIViewController){
        let alert = UIAlertController(title: "", message: "User has been updated.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }

}
