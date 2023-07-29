//
//  ContactDetailsViewController.swift
//  Lesson-2.11_ContactList
//
//  Created by Юрий Куринной on 28.07.2023.
//

import UIKit

final class PersonDetailsViewController: UITableViewController {
    
    // MARK: - Public properties
    
    var person: Person!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = person.fullName
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let phoneCell = tableView.dequeueReusableCell(
                withIdentifier: "phone", for: indexPath)
            
            var phoneContent = phoneCell.defaultContentConfiguration()
            phoneContent.text = String("Phone: \(person.phoneNumber)")
            phoneCell.contentConfiguration = phoneContent
            
            return phoneCell
        
        default:
            let emailCell = tableView.dequeueReusableCell(
                withIdentifier: "email", for: indexPath)
            
            var emailContent = emailCell.defaultContentConfiguration()
            emailContent.text = String("E-mail: \(person.email)")
            emailCell.contentConfiguration = emailContent
            
            return emailCell
        }
    }
}
