//
//  ViewController.swift
//  PhoneBook
//
//  Created by Рустам Шайхинуров on 01.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func buttonDidTap(_ sender: Any) {
        guard let phoneNumber = phoneNumberTextField.text else { return }
        
        if phoneNumber.starts(with: "89087") {
            guard let phoneBookVC = storyboard?.instantiateViewController(withIdentifier: "PhoneBookTableViewController") else { return }
            
            navigationController?.pushViewController(phoneBookVC, animated: true)
            
            
        } else {
            guard let wrongNumberVC = storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") else { return }
            present(wrongNumberVC, animated: true)
            phoneNumberTextField.text = nil
        }
        
    }
    
    // ViewСontroller был загружен
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.placeholder = "Enter your phone number here"
    }
    
    // ViewСontroller скоро будет показан
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // ViewСontroller был показан
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // ViewСontroller будет убран
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // ViewСontroller был убран
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        phoneNumberTextField.text = nil
    }
    
    


}

