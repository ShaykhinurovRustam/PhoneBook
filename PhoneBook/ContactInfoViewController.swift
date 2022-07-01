//
//  ContactInfoViewController.swift
//  PhoneBook
//
//  Created by Рустам Шайхинуров on 01.07.2022.
//

import UIKit

class ContactInfoViewController: UIViewController {

    @IBOutlet weak var phoneNumberButton: UIButton!
    
    @IBAction func phoneNumberButtonDidTap(_ sender: Any) {
    }
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var abbreviatedName: UILabel!
    
    var abbreviated: String?
    var fullName: String?
    var phoneNumber: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let abbreviated = abbreviated {
            abbreviatedName.text = abbreviated
        }
        
        if let fullName = fullName {
            fullNameLabel.text = fullName
        }
        
        if let phoneNumber = phoneNumber {
            phoneNumberButton.setTitle(phoneNumber, for: .normal)
        }
        
        
    }
    
}
