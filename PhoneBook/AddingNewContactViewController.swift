//
//  addingNewContactViewController.swift
//  PhoneBook
//
//  Created by Рустам Шайхинуров on 01.07.2022.
//

import UIKit

protocol AddContactDelegate: AnyObject {
    func saveContact(contact: Contact)
}

class AddingNewContactViewController: UIViewController {
    
    var abreviatedName: String?
    var fullName: String?
    var phoneNumber: String?
    
    weak var delegage: AddContactDelegate?
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var abbreviatedNameField: UITextField!
    

    @IBOutlet weak var fullNameOfContactField: UITextField!
    
    @IBOutlet weak var phoneOfContactField: UITextField!
    
    @IBOutlet weak var confirmButtonDidTap: UIButton!
    
    @IBAction func confirmButtonDidTap(_ sender: Any) {
        
        guard let fullName = fullNameOfContactField.text,
              let abreviatedName = abbreviatedNameField.text,
              let phoneNumber = phoneOfContactField.text
        else { return }
        
        print(fullName)
        
        
        let contact = Contact(contactAbbreviatedName: abreviatedName,
                    contactFullName: fullName, phoneNumber: phoneNumber)
        
        delegage?.saveContact(contact: contact)
        
        dismiss(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameOfContactField.placeholder = "Enter full name of contact"
        abbreviatedNameField.placeholder = "Enter abbreviated name of contact"
        phoneOfContactField.placeholder = "Enter contact phone number"
    }
    
}
