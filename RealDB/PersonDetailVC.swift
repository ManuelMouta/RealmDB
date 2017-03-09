//
//  PersonDetailVC.swift
//  RealmDB
//
//  Created by Manuel Mouta on 09/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class PersonDetailVC: UIViewController,UITableViewDataSource,UITableViewDelegate,DataSentDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak private var _labelPersonName: UITextField!
    @IBOutlet weak private var _labelPersonSurname: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var petPicker: UIPickerView!
    
    //MARK: Local Variables
    var index : Int = Int()

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
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        return cell
    }
    
    func showPersonIndexDetail(index : Int){
        
        self.index = index
        _labelPersonName.text       = ViewController.listOfPersons[index].name
        _labelPersonSurname.text    = ViewController.listOfPersons[index].surname
    }
    
    //MARK: IBActions
    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnDeletePerson(_ sender: UIButton) {
        
        DataBaseManager.deletePerson(person: ViewController.listOfPersons[index])
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnUpdatePerson(_ sender: UIButton) {
        
        DataBaseManager.updatePerson(person: ViewController.listOfPersons[index],name: _labelPersonName.text!, surname: _labelPersonSurname.text!)
        UIAlerts.showUserUpdatedAlert(vc: self)
        
    }
    @IBAction func btnAddPet(_ sender: UIButton) {
    }

}
