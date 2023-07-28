//
//  ContactListViewController.swift
//  Lesson-2.11_ContactList
//
//  Created by Юрий Куринной on 28.07.2023.
//

import UIKit

final class ContactListViewController: UITableViewController {

    // MARK: - Private properties
    
    private let contactList = Person.getPersons()
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let contact = contactList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = String("\(contact.name) \(contact.surname)")
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactDetailsVC = segue.destination as? ContactDetailsViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        contactDetailsVC?.person = contactList[indexPath.row]
    }
    

}
