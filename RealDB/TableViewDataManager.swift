//
//  TableViewDataManager.swift
//  RealmDB
//
//  Created by Manuel Mouta on 09/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation
import UIKit

struct TableViewDataManager {
    
    static func refreshTable(tableView : UITableView){
        DataBaseManager.syncPersonsList()
        tableView.reloadData()
    }
}
