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
        2
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var cellContent = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            cellContent.text = String("Phone: \(person.phoneNumber)")
        default:
            cellContent.text = String("E-mail: \(person.email)")
        }
        
        cell.contentConfiguration = cellContent
        
        return cell
    }
}
