//
//  ViewController.swift
//  RealDB
//
//  Created by Manuel Mouta on 08/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit
import RealmSwift

protocol DataSentDelegate {
    func showPersonIndexDetail(index : Int)
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //MARK: IBOutlets
    @IBOutlet weak private var  _labelName       : UITextField!
    @IBOutlet weak private var  _labelSurname    : UITextField!
    @IBOutlet weak var          tableView        : UITableView!
    
    //MARK: Local Variables
    static var listOfPersons = DataBaseManager.getPersonsList() as! Results<Person>
    var delegate : DataSentDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Refresh table when coming from person detail
        TableViewDataManager.refreshTable(tableView: tableView)
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
        cell.textLabel?.text        = person.name + " " + person.surname
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "segue", sender: self)
        
        if(delegate != nil){
            delegate?.showPersonIndexDetail(index: indexPath.row)
        }
        
        //Other 
        /*let destination = self.storyboard?.instantiateViewController(withIdentifier: String(describing: PersonDetailVC())) as! PersonDetailVC
        destination.index = indexPath
        navigationController?.pushViewController(destination, animated: true)*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "segue"){
            
            let personDetailVC : PersonDetailVC = segue.destination as! PersonDetailVC
            delegate                            = personDetailVC.self
        }
    }
    
    //MARK:UBActions
    @IBAction func btnRegisterUser(_ sender: UIButton) {
        
        DataBaseManager.addPerson(name: _labelName, surname: _labelSurname){
            
            (success,msg) -> (Void) in
            if(success) {
                DataBaseManager.syncPersonsList()
                self.tableView.reloadData()
            }else{
                //Handle Error
            }
        }
    }
}

