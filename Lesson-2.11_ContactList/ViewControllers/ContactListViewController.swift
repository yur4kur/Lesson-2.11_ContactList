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
                            viewForHeaderInSection section: Int) -> UIView? {
        let fullNameLabel = UILabel(
        frame: CGRect(
            x: 16,
            y: 3,
            width: tableView.frame.width,
            height: 20))
        fullNameLabel.text = contactList[section].fullName
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        fullNameLabel.textColor = .white
        
        let contentView = UIView()
        contentView.addSubview(fullNameLabel)
        
        return contentView
    }
    
    override func tableView(_ tableView: UITableView,
                            willDisplayHeaderView view: UIView,
                            forSection section: Int) {
        view.backgroundColor = .gray
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                for: indexPath)
        var cellContent = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0:
            cellContent.text = person.phoneNumber
            cellContent.image = UIImage(systemName: "phone")
        default:
            cellContent.text = person.email
            cellContent.image = UIImage(systemName: "tray")
        }
        
        cell.contentConfiguration = cellContent
        
        return cell
    }
}
