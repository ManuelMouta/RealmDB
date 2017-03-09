//
//  ViewController.swift
//  RealDB
//
//  Created by Manuel Mouta on 08/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //MARK: IBOutlets
    @IBOutlet weak private var  _labelName       : UITextField!
    @IBOutlet weak private var  _labelSurname    : UITextField!
    @IBOutlet weak var          tableView        : UITableView!
    
    //MARK: Local Variables
    static var listOfPersons = DataBaseManager.getPersonsList() as! Results<Person>
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return ViewController.listOfPersons.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        let cell                    = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let person                  = ViewController.listOfPersons[indexPath.row]
        cell.textLabel?.text        = person.name + person.surname
        
        return cell
    }
    
    //MARK:UBActions
    @IBAction func btnRegisterUser(_ sender: UIButton) {
        
        DataBaseManager.addPersonToDb(name: _labelName, surname: _labelSurname){
            
            (success,msg) -> (Void) in
            if(success) {
                DataBaseManager.syncPersonsList()
                self.tableView.reloadData()
            }else{
                //
            }
        }
    }
}

