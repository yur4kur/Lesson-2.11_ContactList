//
//  FullContactListViewController.swift
//  Lesson-2.11_ContactList
//
//  Created by Юрий Куринной on 28.07.2023.
//

import UIKit

final class ContactListViewController: UITableViewController {

    // MARK: - Public properties
    
    var contactList: [Person]!
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView,
                            willDisplayHeaderView view: UIView,
                            forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.backgroundConfiguration?.backgroundColor = .opaqueSeparator
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        contactList.count
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        contactList[section].fullName
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = contactList[indexPath.section]
        switch indexPath.row {
        case 0:
            let phoneCell = tableView.dequeueReusableCell(
                withIdentifier: "phone", for: indexPath)
           
            var phoneContent = phoneCell.defaultContentConfiguration()
            phoneContent.text = person.phoneNumber
            phoneContent.image = UIImage(systemName: "phone")
            phoneCell.contentConfiguration = phoneContent
            
            return phoneCell
        
        default:
            let emailCell = tableView.dequeueReusableCell(
                withIdentifier: "email", for: indexPath)
            
            var emailContent = emailCell.defaultContentConfiguration()
            emailContent.text = person.email
            emailContent.image = UIImage(systemName: "tray")
            emailCell.contentConfiguration = emailContent
            
            return emailCell
        }
    }
}
