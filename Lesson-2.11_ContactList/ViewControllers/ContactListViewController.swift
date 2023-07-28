//
//  FullContactListViewController.swift
//  Lesson-2.11_ContactList
//
//  Created by Юрий Куринной on 28.07.2023.
//

import UIKit

class ContactListViewController: UITableViewController {

    var contactList: [Person]!

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        contactList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let phoneCell = tableView.dequeueReusableCell(withIdentifier: "phone", for: indexPath)
            let person = contactList[indexPath.section]
            var phoneContent = phoneCell.defaultContentConfiguration()
            phoneContent.text = person.phoneNumber
            phoneCell.contentConfiguration = phoneContent
            
            return phoneCell
        
        default:
            let emailCell = tableView.dequeueReusableCell(withIdentifier: "email", for: indexPath)
            var emailContent = emailCell.defaultContentConfiguration()
            let person = contactList[indexPath.section]
            emailContent.text = person.email
            emailCell.contentConfiguration = emailContent
            
            return emailCell
        }
    }
}
