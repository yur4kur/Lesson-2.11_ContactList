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
        
        viewControllers?.forEach{ vc in
            if let navigationVC = vc as? UINavigationController {
                if let contactListVC = navigationVC.topViewController as? PersonsListViewController {
                    contactListVC.contactList = personsList
                }
            } else if let fullContactListVC = vc as? ContactListViewController {
                fullContactListVC.contactList = personsList
            }
        }
    }
}

