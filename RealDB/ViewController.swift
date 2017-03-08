//
//  ViewController.swift
//  RealDB
//
//  Created by Manuel Mouta on 08/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak private var _labelName       : UITextField!
    @IBOutlet weak private var _labelSurname    : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell    = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        return cell
    }
    
    //MARK:UBActions
    @IBAction func btnRegisterUser(_ sender: UIButton) {
        DataBaseManager.addPersonToDb(Person.createPerson(name: <#T##String#>, surname: <#T##String#>)){
            
            (sucess, result) -> (Void) in
            if(sucess) {
                self.tableViewResults.reloadData()
            }
            else {
                // error
            }
        }
    }
}

