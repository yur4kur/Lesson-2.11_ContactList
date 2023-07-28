//
//  PersonsListViewController.swift
//  Lesson-2.11_ContactList
//
//  Created by Юрий Куринной on 28.07.2023.
//

import UIKit

class ContactsTabBarViewController: UITabBarController {
    
    private let personsList = Person.getPersons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers?.forEach{ viewController in
            guard let navigationVC = viewController as? UINavigationController else { return }
            
            if let contactListVC = navigationVC.topViewController as? PersonsListViewController {
            contactListVC.contactList = personsList
            } else if let fullContactListVC = navigationVC.topViewController as? ContactListViewController {
            fullContactListVC.contactList = personsList
            }
        }
    }
}


