//
//  PhoneBookTableViewController.swift
//  PhoneBook
//
//  Created by Рустам Шайхинуров on 01.07.2022.
//

import UIKit

struct Contact {
    let contactAbbreviatedName: String
    let contactFullName: String
    let phoneNumber: String
}

class PhoneBookTableViewController: UITableViewController {
    
    @IBOutlet weak var addNewContactButton: UIButton!
    
    private var contacts: [Contact] = []
    
    @IBAction func addNewContactDidTap(_ sender: Any) {
        guard let addNewContactVC = storyboard?.instantiateViewController(withIdentifier: "AddingNewContactViewController") as? AddingNewContactViewController else { return }
        
        addNewContactVC.delegage = self
    
        present(addNewContactVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        
        cell.contactNameLabel.text = contacts[indexPath.row].contactAbbreviatedName
        cell.phoneNumberLabel.text = contacts[indexPath.row].phoneNumber
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let personalInfoVC = storyboard?.instantiateViewController(withIdentifier: "ContactInfoViewController") as? ContactInfoViewController
        else { return }
        
        personalInfoVC.abbreviated = contacts[indexPath.row].contactAbbreviatedName
        personalInfoVC.fullName = contacts[indexPath.row].contactFullName
        personalInfoVC.phoneNumber = contacts[indexPath.row].phoneNumber
        
        present(personalInfoVC, animated: true)
    }

}

extension PhoneBookTableViewController: AddContactDelegate {
    func saveContact(contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
    
    
}
